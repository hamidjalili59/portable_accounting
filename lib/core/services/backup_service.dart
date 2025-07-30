import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:portable_accounting/core/database/app_database.dart' as db;
import 'package:share_plus/share_plus.dart';

class BackupService {
  final db.AppDatabase _db;

  BackupService(this._db);

  // --- Native Methods ---
  Future<String> getDatabasePath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, '${db.dbName}.sqlite');
  }

  Future<void> shareBackup() async {
    final dbPath = await getDatabasePath();
    await SharePlus.instance.share(
      ShareParams(files: [XFile(dbPath)], text: 'Accounting Backup'),
    );
  }

  Future<String> saveBackupToDownloads() async {
    if (!kIsWeb) {
      final dbPath = await getDatabasePath();
      final bytes = await File(dbPath).readAsBytes();
      final timestamp = DateFormat('yyyy-MM-dd_HH-mm').format(DateTime.now());
      final fileName = 'backup-$timestamp';
      String? savedPath = await FileSaver.instance.saveAs(
        name: fileName,
        bytes: bytes,
        fileExtension: 'db',
        mimeType: MimeType.other,
      );
      if (savedPath == null || savedPath.isEmpty) {
        throw Exception('File saving was cancelled.');
      }
      return savedPath;
    } else {
      throw Exception('Storage permission is required.');
    }
  }

  Future<bool> restoreDatabase() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['db'],
      );
      if (result != null && result.files.single.path != null) {
        await _db.close();
        await File(result.files.single.path!).copy(await getDatabasePath());
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Reads all data from the database and exports it as a single JSON file.
  Future<void> exportDataAsJson() async {
    try {
      final inventory = await _db.select(_db.inventoryItems).get();
      final invoices = await _db.select(_db.invoices).get();
      final saleItems = await _db.select(_db.saleItems).get();

      final exportData = {
        'inventory': inventory.map((item) => item.toJson()).toList(),
        'invoices': invoices.map((invoice) => invoice.toJson()).toList(),
        'saleItems': saleItems.map((item) => item.toJson()).toList(),
      };

      final jsonString = jsonEncode(exportData);
      final bytes = Uint8List.fromList(utf8.encode(jsonString));

      final timestamp = DateFormat('yyyy-MM-dd_HH-mm').format(DateTime.now());
      await FileSaver.instance.saveAs(
        name: 'backup-$timestamp',
        bytes: bytes,
        fileExtension: 'json',
        mimeType: MimeType.json,
      );
    } catch (e) {
      debugPrint('JSON export failed: $e');
      rethrow;
    }
  }

  Future<void> importDataFromJson() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        withData: true,
      );

      if (result == null || result.files.single.bytes == null) {
        throw Exception('No file selected or file is empty.');
      }

      final bytes = result.files.single.bytes!;
      final jsonString = utf8.decode(bytes);
      final importData = jsonDecode(jsonString) as Map<String, dynamic>;

      await _db.transaction(() async {
        await _db.delete(_db.saleItems).go();
        await _db.delete(_db.invoices).go();
        await _db.delete(_db.inventoryItems).go();

        final inventory = (importData['inventory'] as List)
            .map((item) => db.InventoryItem.fromJson(item))
            .toList();
        await _db.batch(
          (batch) => batch.insertAll(_db.inventoryItems, inventory),
        );

        final invoices = (importData['invoices'] as List)
            .map((item) => db.Invoice.fromJson(item))
            .toList();
        await _db.batch((batch) => batch.insertAll(_db.invoices, invoices));

        final saleItems = (importData['saleItems'] as List)
            .map((item) => db.SaleItem.fromJson(item))
            .toList();
        await _db.batch((batch) => batch.insertAll(_db.saleItems, saleItems));
      });
    } catch (e) {
      debugPrint('JSON import failed: $e');
      rethrow;
    }
  }
}

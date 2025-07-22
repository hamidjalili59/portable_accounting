import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:portable_accounting/core/database/app_database.dart';
import 'package:share_plus/share_plus.dart';

class BackupService {
  final AppDatabase _db;

  BackupService(this._db);

  Future<void> shareBackup() async {
    try {
      final dbPath = await getDatabasePath();
      final dbFile = File(dbPath);
      if (!await dbFile.exists()) {
        throw Exception('Database file does not exist.');
      }

      final file = XFile(dbPath);
      await SharePlus.instance.share(
        ShareParams(files: [file], text: 'فایل پشتیبان دیتابیس'),
      );
    } catch (e) {
      debugPrint('Share backup failed: $e');
      rethrow;
    }
  }

  /// Saves the backup file directly to the Downloads folder.
  Future<String> saveBackupToDownloads() async {
    try {
      final dbPath = await getDatabasePath();
      final dbFile = File(dbPath);
      if (!await dbFile.exists()) {
        throw Exception('Database file does not exist.');
      }

      // Create a filename with a timestamp
      final timestamp = DateFormat('yyyy-MM-dd_HH-mm').format(DateTime.now());
      final fileName = 'backup-$timestamp.db';

      // Read the file as bytes
      final bytes = await dbFile.readAsBytes();

      // Use file_saver to save the file
      String? savedPath = await FileSaver.instance.saveFile(
        name: fileName,
        bytes: bytes,
        mimeType: MimeType.other,
      );

      return savedPath;
    } catch (e) {
      debugPrint('Save backup failed: $e');
      rethrow;
    }
  }


  // متد برای پیدا کردن مسیر فایل دیتابیس
  Future<String> getDatabasePath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    // Add ".sqlite" to the filename to match the actual file
    return p.join(dbFolder.path, '$dbName.sqlite');
  }

  // بازیابی دیتابیس از فایل پشتیبان
  Future<bool> restoreDatabase() async {
    try {
      // به کاربر اجازه می‌دهیم یک فایل را انتخاب کند
      final result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.single.path != null) {
        final pickedFile = File(result.files.single.path!);
        final dbPath = await getDatabasePath();

        // **مهم‌ترین بخش:** قبل از جایگزینی فایل، باید اتصال به دیتابیس فعلی را ببندیم.
        await _db.close();

        // فایل انتخاب شده را در مسیر دیتابیس کپی و جایگزین می‌کنیم
        await pickedFile.copy(dbPath);

        // موفقیت‌آمیز بود
        return true;
      }
      return false; // کاربر فایلی انتخاب نکرد
    } catch (e) {
      print('Restore failed: $e');
      return false;
    }
  }
}

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:portable_accounting/core/database/app_database.dart';
import 'package:share_plus/share_plus.dart';

class BackupService {
  final AppDatabase _db;

  BackupService(this._db);

  // متد برای پیدا کردن مسیر فایل دیتابیس
  Future<String> getDatabasePath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(
      dbFolder.path,
      dbName,
    ); // dbName را از app_database.dart ایمپورت کنید
  }

  // پشتیبان‌گیری از دیتابیس
  Future<bool> backupDatabase() async {
    try {
      final dbPath = await getDatabasePath();
      final file = XFile(dbPath);
      final result = await SharePlus.instance.share(
        ShareParams(files: [file], text: 'فایل پشتیبان دیتابیس'),
      );

      return result.status == ShareResultStatus.success;
    } catch (e) {
      if (kDebugMode) {
        print('Backup failed: $e');
      }
      return false;
    }
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

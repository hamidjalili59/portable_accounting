import 'package:flutter/material.dart';
import 'package:portable_accounting/core/di/service_locator.dart';
import 'package:portable_accounting/core/services/backup_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isLoading = false;
  late final BackupService _backupService;

  @override
  void initState() {
    super.initState();
    _backupService = BackupService(sl());
  }

  Future<void> _handleBackup() async {
    // Show a dialog to let the user choose the backup method.
    final choice = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Backup'),
        content: const Text('How would you like to back up your data?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop('share'),
            child: const Text('Share'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop('save'),
            child: const Text('Save to Downloads'),
          ),
        ],
      ),
    );

    if (choice == null) return; // User dismissed the dialog

    setState(() => _isLoading = true);

    try {
      if (choice == 'save') {
        final path = await _backupService.saveBackupToDownloads();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Backup saved successfully to: $path'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else if (choice == 'share') {
        await _backupService.shareBackup();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating backup: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    setState(() => _isLoading = false);
  }

  Future<void> _handleRestore() async {
    // نمایش یک دیالوگ هشدار به کاربر
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('هشدار بازیابی اطلاعات'),
        content: const Text(
          'با بازیابی اطلاعات، تمام داده‌های فعلی شما پاک شده و اطلاعات فایل پشتیبان جایگزین می‌شود. پس از بازیابی، برنامه باید مجدداً راه‌اندازی شود. آیا ادامه می‌دهید؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('لغو'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('تایید و بازیابی'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() => _isLoading = true);
      final success = await _backupService.restoreDatabase();
      if (mounted) {
        if (success) {
          // نمایش پیام موفقیت و درخواست راه‌اندازی مجدد
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => AlertDialog(
              title: const Text('بازیابی موفق'),
              content: const Text(
                'اطلاعات با موفقیت بازیابی شد. لطفاً برای اعمال تغییرات، برنامه را ببندید و دوباره باز کنید.',
              ),
              actions: [
                FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('متوجه شدم'),
                ),
              ],
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('خطا در بازیابی یا فایلی انتخاب نشد.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تنظیمات و پشتیبان‌گیری')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.backup_outlined),
                    title: const Text('تهیه نسخه پشتیبان'),
                    subtitle: const Text(
                      'یک نسخه از اطلاعات خود را به صورت فایل ذخیره کنید.',
                    ),
                    onTap: _handleBackup,
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.restore_page_outlined),
                    title: const Text('بازیابی از نسخه پشتیبان'),
                    subtitle: const Text(
                      'اطلاعات خود را از یک فایل پشتیبان بازگردانید.',
                    ),
                    onTap: _handleRestore,
                  ),
                ],
              ),
            ),
    );
  }
}

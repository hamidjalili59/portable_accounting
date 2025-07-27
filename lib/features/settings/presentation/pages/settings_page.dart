import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/di/service_locator.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/backup_service.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/services/locale_cubit.dart';

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
    final l10n = context.l10n;
    // Show a dialog to let the user choose the backup method.
    final choice = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settings_backupDialogTitle),
        content: Text(l10n.settings_backupDialogMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop('share'),
            child: Text(l10n.global_share),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop('save'),
            child: Text(l10n.settings_saveToDownloads),
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
              content: Text(l10n.settings_backupSuccessMessage(path)),
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
            content: Text(l10n.settings_backupErrorMessage(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    setState(() => _isLoading = false);
  }

  Future<void> _handleRestore() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.settings_restoreWarningTitle),
        content: Text(l10n.settings_restoreWarningMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.global_cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.settings_restoreConfirmButton),
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
              title: Text(l10n.settings_restoreSuccessTitle),
              content: Text(l10n.settings_restoreSuccessMessage),
              actions: [
                FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(l10n.settings_iUnderstandButton),
                ),
              ],
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.settings_restoreErrorMessage),
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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings_backupTitle)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.backup_outlined),
                    title: Text(l10n.settings_createBackup),
                    subtitle: Text(l10n.settings_createBackupSubtitle),
                    onTap: _handleBackup,
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.restore_page_outlined),
                    title: Text(l10n.settings_restoreBackup),
                    subtitle: Text(l10n.settings_restoreBackupSubtitle),
                    onTap: _handleRestore,
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.attach_money_outlined),
                    title: Text(l10n.settings_currency),
                    trailing: DropdownButton<CurrencyUnit>(
                      value: context
                          .watch<CurrencyCubit>()
                          .state, // خواندن وضعیت فعلی
                      items: CurrencyUnit.values.map((unit) {
                        return DropdownMenuItem(
                          value: unit,
                          child: Text(unit.displayName),
                        );
                      }).toList(),
                      onChanged: (newUnit) {
                        if (newUnit != null) {
                          // ارسال درخواست تغییر واحد پولی به Cubit
                          context.read<CurrencyCubit>().setCurrency(newUnit);
                        }
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: Text(l10n.settings_language),
                    trailing: DropdownButton<Locale>(
                      value: context.watch<LocaleCubit>().state,
                      items: const [
                        DropdownMenuItem(
                          value: Locale('en'),
                          child: Text('English'),
                        ),
                        DropdownMenuItem(
                          value: Locale('fa'),
                          child: Text('فارسی'),
                        ),
                      ],
                      onChanged: (newLocale) {
                        if (newLocale != null) {
                          context.read<LocaleCubit>().setLocale(newLocale);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

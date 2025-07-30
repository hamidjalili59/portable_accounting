import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/di/service_locator.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/backup_service.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/services/locale_cubit.dart';
import 'package:portable_accounting/core/services/settings_cubit.dart';

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

  // Native Backup Handler
  // Future<void> _handleNativeBackup() async {
  //   final l10n = context.l10n;
  //   final choice = await showDialog<String>(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(l10n.settings_backupDialogTitle),
  //       content: Text(l10n.settings_backupDialogMessage),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop('share'),
  //           child: Text(l10n.global_share),
  //         ),
  //         FilledButton(
  //           onPressed: () => Navigator.of(context).pop('save'),
  //           child: Text(l10n.settings_saveToDownloads),
  //         ),
  //       ],
  //     ),
  //   );
  //   if (choice == null) return;
  //   setState(() => _isLoading = true);
  //   try {
  //     if (choice == 'save') {
  //       final path = await _backupService.saveBackupToDownloads();
  //       if (mounted) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(l10n.settings_backupSuccessMessage(path)),
  //             backgroundColor: Colors.green,
  //           ),
  //         );
  //       }
  //     } else if (choice == 'share') {
  //       await _backupService.shareBackup();
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(l10n.settings_backupErrorMessage(e.toString())),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   }
  //   setState(() => _isLoading = false);
  // }

  // Native Restore Handler
  // Future<void> _handleNativeRestore() async {
  //   final l10n = context.l10n;
  //   final confirmed = await showDialog<bool>(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: Text(l10n.settings_restoreWarningTitle),
  //       content: Text(l10n.settings_restoreWarningMessage),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(ctx).pop(false),
  //           child: Text(l10n.global_cancel),
  //         ),
  //         FilledButton(
  //           onPressed: () => Navigator.of(ctx).pop(true),
  //           child: Text(l10n.settings_restoreConfirmButton),
  //         ),
  //       ],
  //     ),
  //   );
  //   if (confirmed != true) return;
  //   setState(() => _isLoading = true);
  //   final success = await _backupService.restoreDatabase();
  //   if (mounted) {
  //     if (success) {
  //       await showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (ctx) => AlertDialog(
  //           title: Text(l10n.settings_restoreSuccessTitle),
  //           content: Text(l10n.settings_restoreSuccessMessage),
  //           actions: [
  //             FilledButton(
  //               onPressed: () => Navigator.of(ctx).pop(),
  //               child: Text(l10n.settings_iUnderstandButton),
  //             ),
  //           ],
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(l10n.settings_restoreErrorMessage),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   }
  //   setState(() => _isLoading = false);
  // }

  // Web Handlers
  Future<void> _handleExport() async {
    setState(() => _isLoading = true);
    final l10n = context.l10n;
    try {
      await _backupService.exportDataAsJson();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('فایل پشتیبان JSON آماده دانلود است.'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.settings_backupErrorMessage(e.toString())), backgroundColor: Colors.red),
        );
      }
    }
    setState(() => _isLoading = false);
  }

  Future<void> _handleImport() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.settings_restoreWarningTitle),
        content: Text(l10n.settings_restoreWarningMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(l10n.global_cancel)),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(l10n.settings_restoreConfirmButton)),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);
    try {
      await _backupService.importDataFromJson();
      if (mounted) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: Text(l10n.settings_restoreSuccessTitle),
            content: Text("اطلاعات با موفقیت بازیابی شد. برای مشاهده تغییرات، برنامه را مجدداً راه‌اندازی کنید."),
            actions: [
              FilledButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(l10n.settings_iUnderstandButton)),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.settings_restoreErrorMessage), backgroundColor: Colors.red),
        );
      }
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.page_settings)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                 ...[
                  ListTile(
                    leading: const Icon(Icons.download_outlined),
                    title: Text(l10n.settings_exportDataTitle),
                    subtitle: Text(l10n.settings_exportDataSubtitle),
                    onTap: _handleExport,
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.upload_outlined),
                    title: Text(l10n.settings_importDataTitle),
                    subtitle: Text(l10n.settings_importDataSubtitle),
                    onTap: _handleImport,
                  ),
                ],
                // else ...[
                //   ListTile(
                //     leading: const Icon(Icons.backup_outlined),
                //     title: Text(l10n.settings_createBackup),
                //     subtitle: Text(l10n.settings_createBackupSubtitle),
                //     onTap: _handleNativeBackup,
                //   ),
                //   const Divider(),
                //   ListTile(
                //     leading: const Icon(Icons.restore_page_outlined),
                //     title: Text(l10n.settings_restoreBackup),
                //     subtitle: Text(l10n.settings_restoreBackupSubtitle),
                //     onTap: _handleNativeRestore,
                //   ),
                // ],
                const Divider(),
                ListTile(
                  title: Text(l10n.settings_stockValueCalculationTitle),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: BlocBuilder<SettingsCubit, StockValueCalculation>(
                      builder: (context, currentSetting) {
                        return SegmentedButton<StockValueCalculation>(
                          segments: <ButtonSegment<StockValueCalculation>>[
                            ButtonSegment(
                              value: StockValueCalculation.basedOnPurchasePrice,
                              label: Text(
                                l10n.settings_stockValueCalculationPurchasePrice,
                              ),
                            ),
                            ButtonSegment(
                              value: StockValueCalculation.basedOnSalePrice,
                              label: Text(
                                l10n.settings_stockValueCalculationSalePrice,
                              ),
                            ),
                          ],
                          selected: {currentSetting},
                          onSelectionChanged: (newSelection) {
                            context
                                .read<SettingsCubit>()
                                .setStockValueCalculation(newSelection.first);
                          },
                        );
                      },
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.attach_money_outlined),
                  title: Text(l10n.settings_currency),
                  trailing: DropdownButton<CurrencyUnit>(
                    value: context.watch<CurrencyCubit>().state,
                    items: CurrencyUnit.values
                        .map(
                          (unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(unit.displayName),
                          ),
                        )
                        .toList(),
                    onChanged: (newUnit) {
                      if (newUnit != null) {
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
    );
  }
}

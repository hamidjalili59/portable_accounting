import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fa'),
  ];

  /// No description provided for @global_appName.
  ///
  /// In en, this message translates to:
  /// **'Portable Accounting'**
  String get global_appName;

  /// No description provided for @global_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get global_cancel;

  /// No description provided for @global_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get global_delete;

  /// No description provided for @global_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get global_edit;

  /// No description provided for @global_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get global_save;

  /// No description provided for @global_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get global_share;

  /// No description provided for @global_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get global_confirm;

  /// No description provided for @global_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get global_error;

  /// No description provided for @global_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get global_success;

  /// No description provided for @global_na.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get global_na;

  /// No description provided for @global_actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get global_actions;

  /// No description provided for @page_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get page_dashboard;

  /// No description provided for @page_inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get page_inventory;

  /// No description provided for @page_invoices.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get page_invoices;

  /// No description provided for @page_reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get page_reports;

  /// No description provided for @page_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get page_settings;

  /// No description provided for @dashboard_last7DaysProfit.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days Profit'**
  String get dashboard_last7DaysProfit;

  /// No description provided for @dashboard_bestSellingItems.
  ///
  /// In en, this message translates to:
  /// **'Best-Selling Items'**
  String get dashboard_bestSellingItems;

  /// No description provided for @dashboard_noChartData.
  ///
  /// In en, this message translates to:
  /// **'Not enough data to show profit chart.'**
  String get dashboard_noChartData;

  /// No description provided for @dashboard_noSalesData.
  ///
  /// In en, this message translates to:
  /// **'No sales data available to show top products.'**
  String get dashboard_noSalesData;

  /// No description provided for @dashboard_netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get dashboard_netProfit;

  /// No description provided for @dashboard_totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get dashboard_totalRevenue;

  /// No description provided for @dashboard_totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get dashboard_totalCost;

  /// No description provided for @dashboard_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get dashboard_totalSales;

  /// No description provided for @inventory_title.
  ///
  /// In en, this message translates to:
  /// **'Inventory Management'**
  String get inventory_title;

  /// No description provided for @inventory_addNewItem.
  ///
  /// In en, this message translates to:
  /// **'Add New Item'**
  String get inventory_addNewItem;

  /// No description provided for @inventory_newSale.
  ///
  /// In en, this message translates to:
  /// **'New Sale'**
  String get inventory_newSale;

  /// No description provided for @inventory_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get inventory_stock;

  /// No description provided for @inventory_unique_items.
  ///
  /// In en, this message translates to:
  /// **'Unique Items'**
  String get inventory_unique_items;

  /// No description provided for @inventory_total_stock_value.
  ///
  /// In en, this message translates to:
  /// **'Total Stock Value'**
  String get inventory_total_stock_value;

  /// No description provided for @inventory_emptyStateTitle.
  ///
  /// In en, this message translates to:
  /// **'Your inventory is empty!'**
  String get inventory_emptyStateTitle;

  /// No description provided for @inventory_emptyStateMessage.
  ///
  /// In en, this message translates to:
  /// **'Add your first item to get started.'**
  String get inventory_emptyStateMessage;

  /// No description provided for @inventory_searchByNameHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get inventory_searchByNameHint;

  /// No description provided for @inventory_item_name.
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get inventory_item_name;

  /// No description provided for @inventory_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get inventory_quantity;

  /// No description provided for @inventory_purchase_price.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get inventory_purchase_price;

  /// No description provided for @inventory_purchase_price_field.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price (Rial)'**
  String get inventory_purchase_price_field;

  /// No description provided for @inventory_sale_price_field.
  ///
  /// In en, this message translates to:
  /// **'Sale Price (Rial)'**
  String get inventory_sale_price_field;

  /// No description provided for @inventory_sale_price.
  ///
  /// In en, this message translates to:
  /// **'Sale Price'**
  String get inventory_sale_price;

  /// No description provided for @form_addNewItemTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Item'**
  String get form_addNewItemTitle;

  /// No description provided for @form_editItemTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get form_editItemTitle;

  /// No description provided for @form_validator_pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the item name'**
  String get form_validator_pleaseEnterName;

  /// No description provided for @form_validator_pleaseEnterValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get form_validator_pleaseEnterValidNumber;

  /// No description provided for @form_saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get form_saveChanges;

  /// No description provided for @form_imageSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Image Source'**
  String get form_imageSourceTitle;

  /// No description provided for @form_gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get form_gallery;

  /// No description provided for @form_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get form_camera;

  /// No description provided for @invoices_emptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Invoices Yet!'**
  String get invoices_emptyTitle;

  /// No description provided for @invoices_emptyMessage.
  ///
  /// In en, this message translates to:
  /// **'After your first sale, the invoice will be displayed here.'**
  String get invoices_emptyMessage;

  /// No description provided for @invoices_createFirst.
  ///
  /// In en, this message translates to:
  /// **'Create First Invoice'**
  String get invoices_createFirst;

  /// No description provided for @invoices_invoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Invoice #{id}'**
  String invoices_invoiceNumber(Object id);

  /// No description provided for @invoices_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get invoices_customer;

  /// No description provided for @invoices_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get invoices_date;

  /// No description provided for @reports_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select Date Range'**
  String get reports_selectDateRange;

  /// No description provided for @reports_from.
  ///
  /// In en, this message translates to:
  /// **'From: {date}'**
  String reports_from(Object date);

  /// No description provided for @reports_to.
  ///
  /// In en, this message translates to:
  /// **'To: {date}'**
  String reports_to(Object date);

  /// No description provided for @reports_generateButton.
  ///
  /// In en, this message translates to:
  /// **'Generate Sales Report'**
  String get reports_generateButton;

  /// No description provided for @reports_initialMessage.
  ///
  /// In en, this message translates to:
  /// **'Please select a date range and generate a report.'**
  String get reports_initialMessage;

  /// No description provided for @reports_noSalesFound.
  ///
  /// In en, this message translates to:
  /// **'No sales found in this date range.'**
  String get reports_noSalesFound;

  /// No description provided for @reports_totalInvoices.
  ///
  /// In en, this message translates to:
  /// **'Total Invoices: {count}'**
  String reports_totalInvoices(Object count);

  /// No description provided for @reports_totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue: {amount}'**
  String reports_totalRevenue(Object amount);

  /// No description provided for @settings_backupTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings & Backup'**
  String get settings_backupTitle;

  /// No description provided for @settings_createBackup.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get settings_createBackup;

  /// No description provided for @settings_createBackupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Save a copy of your data as a file.'**
  String get settings_createBackupSubtitle;

  /// No description provided for @settings_restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore from Backup'**
  String get settings_restoreBackup;

  /// No description provided for @settings_restoreBackupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Restore your data from a backup file.'**
  String get settings_restoreBackupSubtitle;

  /// No description provided for @settings_currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get settings_currency;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_backupDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get settings_backupDialogTitle;

  /// No description provided for @settings_backupDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'How would you like to back up your data?'**
  String get settings_backupDialogMessage;

  /// No description provided for @settings_saveToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Save to Downloads'**
  String get settings_saveToDownloads;

  /// No description provided for @settings_backupSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Backup saved successfully to: {path}'**
  String settings_backupSuccessMessage(Object path);

  /// No description provided for @settings_backupErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error creating backup: {error}'**
  String settings_backupErrorMessage(Object error);

  /// No description provided for @settings_restoreWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore Warning'**
  String get settings_restoreWarningTitle;

  /// No description provided for @settings_restoreWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'Restoring data will erase all current data and replace it with the backup file. The app must be restarted after restoring. Do you want to continue?'**
  String get settings_restoreWarningMessage;

  /// No description provided for @settings_restoreConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Restore'**
  String get settings_restoreConfirmButton;

  /// No description provided for @settings_restoreSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore Successful'**
  String get settings_restoreSuccessTitle;

  /// No description provided for @settings_restoreSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Data was restored successfully. Please close and reopen the app to apply the changes.'**
  String get settings_restoreSuccessMessage;

  /// No description provided for @settings_iUnderstandButton.
  ///
  /// In en, this message translates to:
  /// **'I Understand'**
  String get settings_iUnderstandButton;

  /// No description provided for @settings_restoreErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error restoring or no file was selected.'**
  String get settings_restoreErrorMessage;

  /// No description provided for @createInvoice_title.
  ///
  /// In en, this message translates to:
  /// **'Create New Invoice'**
  String get createInvoice_title;

  /// No description provided for @createInvoice_exitConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit Confirmation'**
  String get createInvoice_exitConfirmTitle;

  /// No description provided for @createInvoice_exitConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'You have items in your invoice. Are you sure you want to exit and discard them?'**
  String get createInvoice_exitConfirmMessage;

  /// No description provided for @createInvoice_stay.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get createInvoice_stay;

  /// No description provided for @createInvoice_exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get createInvoice_exit;

  /// No description provided for @createInvoice_successSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Invoice created successfully!'**
  String get createInvoice_successSnackbar;

  /// No description provided for @createInvoice_initializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing...'**
  String get createInvoice_initializing;

  /// No description provided for @createInvoice_addItemButton.
  ///
  /// In en, this message translates to:
  /// **'Add Item to Invoice'**
  String get createInvoice_addItemButton;

  /// No description provided for @createInvoice_availableItems.
  ///
  /// In en, this message translates to:
  /// **'Available Items'**
  String get createInvoice_availableItems;

  /// No description provided for @createInvoice_inStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock: {quantity}'**
  String createInvoice_inStock(Object quantity);

  /// No description provided for @createInvoice_currentInvoice.
  ///
  /// In en, this message translates to:
  /// **'Current Invoice'**
  String get createInvoice_currentInvoice;

  /// No description provided for @createInvoice_noItemsSelected.
  ///
  /// In en, this message translates to:
  /// **'No items selected.'**
  String get createInvoice_noItemsSelected;

  /// No description provided for @createInvoice_itemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{quantity} x {price}'**
  String createInvoice_itemSubtitle(Object price, Object quantity);

  /// No description provided for @createInvoice_customerNameHint.
  ///
  /// In en, this message translates to:
  /// **'Customer Name (Optional)'**
  String get createInvoice_customerNameHint;

  /// No description provided for @createInvoice_total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get createInvoice_total;

  /// No description provided for @createInvoice_submitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit Invoice'**
  String get createInvoice_submitButton;

  /// No description provided for @dialog_deleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get dialog_deleteConfirmTitle;

  /// No description provided for @dialog_deleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{itemName}\"?'**
  String dialog_deleteConfirmMessage(Object itemName);

  /// No description provided for @dialog_discardChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard Changes?'**
  String get dialog_discardChangesTitle;

  /// No description provided for @dialog_discardChangesMessage.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes. Are you sure you want to go back?'**
  String get dialog_discardChangesMessage;

  /// No description provided for @global_stay.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get global_stay;

  /// No description provided for @global_discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get global_discard;

  /// No description provided for @inventory_controls_searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get inventory_controls_searchHint;

  /// No description provided for @inventory_controls_sortByNameAsc.
  ///
  /// In en, this message translates to:
  /// **'Name (A-Z)'**
  String get inventory_controls_sortByNameAsc;

  /// No description provided for @inventory_controls_sortByNameDesc.
  ///
  /// In en, this message translates to:
  /// **'Name (Z-A)'**
  String get inventory_controls_sortByNameDesc;

  /// No description provided for @inventory_controls_sortByQuantityAsc.
  ///
  /// In en, this message translates to:
  /// **'Quantity (Low-High)'**
  String get inventory_controls_sortByQuantityAsc;

  /// No description provided for @inventory_controls_sortByQuantityDesc.
  ///
  /// In en, this message translates to:
  /// **'Quantity (High-Low)'**
  String get inventory_controls_sortByQuantityDesc;

  /// No description provided for @global_image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get global_image;

  /// No description provided for @reports_search_by_name.
  ///
  /// In en, this message translates to:
  /// **'Search by customer name...'**
  String get reports_search_by_name;

  /// No description provided for @reports_apply_filters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get reports_apply_filters;

  /// No description provided for @global_print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get global_print;

  /// No description provided for @settings_stockValueCalculationTitle.
  ///
  /// In en, this message translates to:
  /// **'Stock Value Calculation'**
  String get settings_stockValueCalculationTitle;

  /// No description provided for @settings_stockValueCalculationPurchasePrice.
  ///
  /// In en, this message translates to:
  /// **'By Purchase Price'**
  String get settings_stockValueCalculationPurchasePrice;

  /// No description provided for @settings_stockValueCalculationSalePrice.
  ///
  /// In en, this message translates to:
  /// **'By Sale Price'**
  String get settings_stockValueCalculationSalePrice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

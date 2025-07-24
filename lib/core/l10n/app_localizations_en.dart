// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get global_appName => 'Portable Accounting';

  @override
  String get global_cancel => 'Cancel';

  @override
  String get global_delete => 'Delete';

  @override
  String get global_edit => 'Edit';

  @override
  String get global_save => 'Save';

  @override
  String get global_share => 'Share';

  @override
  String get global_confirm => 'Confirm';

  @override
  String get global_error => 'Error';

  @override
  String get global_success => 'Success';

  @override
  String get global_na => 'N/A';

  @override
  String get global_actions => 'Actions';

  @override
  String get page_dashboard => 'Dashboard';

  @override
  String get page_inventory => 'Inventory';

  @override
  String get page_invoices => 'Invoices';

  @override
  String get page_reports => 'Reports';

  @override
  String get page_settings => 'Settings';

  @override
  String get dashboard_last7DaysProfit => 'Last 7 Days Profit';

  @override
  String get dashboard_bestSellingItems => 'Best-Selling Items';

  @override
  String get dashboard_noChartData => 'Not enough data to show profit chart.';

  @override
  String get dashboard_noSalesData =>
      'No sales data available to show top products.';

  @override
  String get dashboard_netProfit => 'Net Profit';

  @override
  String get dashboard_totalRevenue => 'Total Revenue';

  @override
  String get dashboard_totalCost => 'Total Cost';

  @override
  String get dashboard_totalSales => 'Total Sales';

  @override
  String get inventory_title => 'Inventory Management';

  @override
  String get inventory_addNewItem => 'Add New Item';

  @override
  String get inventory_newSale => 'New Sale';

  @override
  String get inventory_stock => 'Stock';

  @override
  String get inventory_unique_items => 'Unique Items';

  @override
  String get inventory_total_stock_value => 'Total Stock Value';

  @override
  String get inventory_emptyStateTitle => 'Your inventory is empty!';

  @override
  String get inventory_emptyStateMessage =>
      'Add your first item to get started.';

  @override
  String get inventory_searchByNameHint => 'Search by name...';

  @override
  String get inventory_item_name => 'Item Name';

  @override
  String get inventory_quantity => 'Quantity';

  @override
  String get inventory_purchase_price => 'Purchase Price (Rial)';

  @override
  String get inventory_sale_price => 'Sale Price (Rial)';

  @override
  String get form_addNewItemTitle => 'Add New Item';

  @override
  String get form_editItemTitle => 'Edit Item';

  @override
  String get form_validator_pleaseEnterName => 'Please enter the item name';

  @override
  String get form_validator_pleaseEnterValidNumber =>
      'Please enter a valid number';

  @override
  String get form_saveChanges => 'Save Changes';

  @override
  String get form_imageSourceTitle => 'Choose Image Source';

  @override
  String get form_gallery => 'Gallery';

  @override
  String get form_camera => 'Camera';

  @override
  String get invoices_emptyTitle => 'No Invoices Yet!';

  @override
  String get invoices_emptyMessage =>
      'After your first sale, the invoice will be displayed here.';

  @override
  String get invoices_createFirst => 'Create First Invoice';

  @override
  String invoices_invoiceNumber(Object id) {
    return 'Invoice #$id';
  }

  @override
  String get invoices_customer => 'Customer';

  @override
  String get invoices_date => 'Date';

  @override
  String get reports_selectDateRange => 'Select Date Range';

  @override
  String reports_from(Object date) {
    return 'From: $date';
  }

  @override
  String reports_to(Object date) {
    return 'To: $date';
  }

  @override
  String get reports_generateButton => 'Generate Sales Report';

  @override
  String get reports_initialMessage =>
      'Please select a date range and generate a report.';

  @override
  String get reports_noSalesFound => 'No sales found in this date range.';

  @override
  String reports_totalInvoices(Object count) {
    return 'Total Invoices: $count';
  }

  @override
  String reports_totalRevenue(Object amount) {
    return 'Total Revenue: $amount';
  }

  @override
  String get settings_backupTitle => 'Settings & Backup';

  @override
  String get settings_createBackup => 'Create Backup';

  @override
  String get settings_createBackupSubtitle =>
      'Save a copy of your data as a file.';

  @override
  String get settings_restoreBackup => 'Restore from Backup';

  @override
  String get settings_restoreBackupSubtitle =>
      'Restore your data from a backup file.';

  @override
  String get settings_currency => 'Currency';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_backupDialogTitle => 'Create Backup';

  @override
  String get settings_backupDialogMessage =>
      'How would you like to back up your data?';

  @override
  String get settings_saveToDownloads => 'Save to Downloads';

  @override
  String settings_backupSuccessMessage(Object path) {
    return 'Backup saved successfully to: $path';
  }

  @override
  String settings_backupErrorMessage(Object error) {
    return 'Error creating backup: $error';
  }

  @override
  String get settings_restoreWarningTitle => 'Restore Warning';

  @override
  String get settings_restoreWarningMessage =>
      'Restoring data will erase all current data and replace it with the backup file. The app must be restarted after restoring. Do you want to continue?';

  @override
  String get settings_restoreConfirmButton => 'Confirm & Restore';

  @override
  String get settings_restoreSuccessTitle => 'Restore Successful';

  @override
  String get settings_restoreSuccessMessage =>
      'Data was restored successfully. Please close and reopen the app to apply the changes.';

  @override
  String get settings_iUnderstandButton => 'I Understand';

  @override
  String get settings_restoreErrorMessage =>
      'Error restoring or no file was selected.';

  @override
  String get createInvoice_title => 'Create New Invoice';

  @override
  String get createInvoice_exitConfirmTitle => 'Exit Confirmation';

  @override
  String get createInvoice_exitConfirmMessage =>
      'You have items in your invoice. Are you sure you want to exit and discard them?';

  @override
  String get createInvoice_stay => 'Stay';

  @override
  String get createInvoice_exit => 'Exit';

  @override
  String get createInvoice_successSnackbar => 'Invoice created successfully!';

  @override
  String get createInvoice_initializing => 'Initializing...';

  @override
  String get createInvoice_addItemButton => 'Add Item to Invoice';

  @override
  String get createInvoice_availableItems => 'Available Items';

  @override
  String createInvoice_inStock(Object quantity) {
    return 'In Stock: $quantity';
  }

  @override
  String get createInvoice_currentInvoice => 'Current Invoice';

  @override
  String get createInvoice_noItemsSelected => 'No items selected.';

  @override
  String createInvoice_itemSubtitle(Object price, Object quantity) {
    return '$quantity x $price';
  }

  @override
  String get createInvoice_customerNameHint => 'Customer Name (Optional)';

  @override
  String get createInvoice_total => 'Total:';

  @override
  String get createInvoice_submitButton => 'Submit Invoice';

  @override
  String get dialog_deleteConfirmTitle => 'Confirm Deletion';

  @override
  String dialog_deleteConfirmMessage(Object itemName) {
    return 'Are you sure you want to delete \"$itemName\"?';
  }

  @override
  String get dialog_discardChangesTitle => 'Discard Changes?';

  @override
  String get dialog_discardChangesMessage =>
      'You have unsaved changes. Are you sure you want to go back?';

  @override
  String get global_stay => 'Stay';

  @override
  String get global_discard => 'Discard';

  @override
  String get inventory_controls_searchHint => 'Search by name...';

  @override
  String get inventory_controls_sortByNameAsc => 'Name (A-Z)';

  @override
  String get inventory_controls_sortByNameDesc => 'Name (Z-A)';

  @override
  String get inventory_controls_sortByQuantityAsc => 'Quantity (Low-High)';

  @override
  String get inventory_controls_sortByQuantityDesc => 'Quantity (High-Low)';

  @override
  String get global_image => 'Image';
}

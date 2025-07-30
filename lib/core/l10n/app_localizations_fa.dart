// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get global_appName => 'حسابداری همراه';

  @override
  String get global_cancel => 'لغو';

  @override
  String get global_delete => 'حذف';

  @override
  String get global_edit => 'ویرایش';

  @override
  String get global_save => 'ذخیره';

  @override
  String get global_share => 'اشتراک‌گذاری';

  @override
  String get global_confirm => 'تایید';

  @override
  String get global_error => 'خطا';

  @override
  String get global_success => 'موفقیت';

  @override
  String get global_na => 'نامشخص';

  @override
  String get global_actions => 'عملیات';

  @override
  String get page_dashboard => 'داشبورد';

  @override
  String get page_inventory => 'انبار';

  @override
  String get page_invoices => 'فاکتورها';

  @override
  String get page_reports => 'گزارش‌ها';

  @override
  String get page_settings => 'تنظیمات';

  @override
  String get dashboard_last7DaysProfit => 'سود ۷ روز گذشته';

  @override
  String get dashboard_bestSellingItems => 'پرفروش‌ترین کالاها';

  @override
  String get dashboard_noChartData => 'داده‌ای برای نمایش نمودار وجود ندارد.';

  @override
  String get dashboard_noSalesData =>
      'داده فروشی برای نمایش پرفروش‌ترین‌ها موجود نیست.';

  @override
  String get dashboard_netProfit => 'سود خالص';

  @override
  String get dashboard_totalRevenue => 'درآمد کل';

  @override
  String get dashboard_totalCost => 'هزینه کل';

  @override
  String get dashboard_totalSales => 'تعداد کل فروش';

  @override
  String get inventory_title => 'مدیریت موجودی';

  @override
  String get inventory_addNewItem => 'افزودن کالای جدید';

  @override
  String get inventory_newSale => 'فروش جدید';

  @override
  String get inventory_stock => 'موجودی';

  @override
  String get inventory_unique_items => 'اقلام منحصر به فرد';

  @override
  String get inventory_total_stock_value => 'ارزش کل انبار';

  @override
  String get inventory_emptyStateTitle => 'انبار شما خالی است!';

  @override
  String get inventory_emptyStateMessage =>
      'برای شروع، اولین کالای خود را اضافه کنید.';

  @override
  String get inventory_searchByNameHint => 'جستجو بر اساس نام...';

  @override
  String get inventory_item_name => 'نام کالا';

  @override
  String get inventory_quantity => 'تعداد';

  @override
  String get inventory_purchase_price => 'قیمت خرید';

  @override
  String get inventory_purchase_price_field => 'قیمت خرید (ریال)';

  @override
  String get inventory_sale_price_field => 'قیمت فروش (ریال)';

  @override
  String get inventory_sale_price => 'قیمت فروش';

  @override
  String get form_addNewItemTitle => 'افزودن کالای جدید';

  @override
  String get form_editItemTitle => 'ویرایش کالا';

  @override
  String get form_validator_pleaseEnterName => 'لطفاً نام کالا را وارد کنید';

  @override
  String get form_validator_pleaseEnterValidNumber =>
      'لطفاً یک عدد معتبر وارد کنید';

  @override
  String get form_saveChanges => 'ذخیره تغییرات';

  @override
  String get form_imageSourceTitle => 'انتخاب منبع عکس';

  @override
  String get form_gallery => 'گالری';

  @override
  String get form_camera => 'دوربین';

  @override
  String get invoices_emptyTitle => 'هنوز فاکتوری ثبت نشده!';

  @override
  String get invoices_emptyMessage =>
      'پس از ثبت اولین فروش، فاکتور آن در اینجا نمایش داده می‌شود.';

  @override
  String get invoices_createFirst => 'ثبت اولین فاکتور';

  @override
  String invoices_invoiceNumber(Object id) {
    return 'فاکتور #$id';
  }

  @override
  String get invoices_customer => 'مشتری';

  @override
  String get invoices_date => 'تاریخ';

  @override
  String get reports_selectDateRange => 'انتخاب بازه زمانی';

  @override
  String reports_from(Object date) {
    return 'از تاریخ: $date';
  }

  @override
  String reports_to(Object date) {
    return 'تا تاریخ: $date';
  }

  @override
  String get reports_generateButton => 'تولید گزارش فروش';

  @override
  String get reports_initialMessage =>
      'لطفاً یک بازه زمانی انتخاب و گزارش را تولید کنید.';

  @override
  String get reports_noSalesFound => 'هیچ فروشی در این بازه زمانی یافت نشد.';

  @override
  String reports_totalInvoices(Object count) {
    return 'تعداد فاکتورها: $count';
  }

  @override
  String reports_totalRevenue(Object amount) {
    return 'درآمد کل: $amount';
  }

  @override
  String get settings_backupTitle => 'پشتیبان‌گیری و بازیابی';

  @override
  String get settings_createBackup => 'تهیه نسخه پشتیبان';

  @override
  String get settings_createBackupSubtitle =>
      'یک نسخه از اطلاعات خود را به صورت فایل ذخیره کنید.';

  @override
  String get settings_restoreBackup => 'بازیابی از پشتیبان';

  @override
  String get settings_restoreBackupSubtitle =>
      'اطلاعات خود را از یک فایل پشتیبان بازگردانید.';

  @override
  String get settings_currency => 'واحد پولی';

  @override
  String get settings_language => 'زبان';

  @override
  String get settings_backupDialogTitle => 'تهیه نسخه پشتیبان';

  @override
  String get settings_backupDialogMessage =>
      'چگونه می‌خواهید از اطلاعات خود پشتیبان‌گیری کنید؟';

  @override
  String get settings_saveToDownloads => 'ذخیره در دانلودها';

  @override
  String settings_backupSuccessMessage(Object path) {
    return 'پشتیبان با موفقیت در مسیر زیر ذخیره شد: $path';
  }

  @override
  String settings_backupErrorMessage(Object error) {
    return 'خطا در تهیه پشتیبان: $error';
  }

  @override
  String get settings_restoreWarningTitle => 'هشدار بازیابی';

  @override
  String get settings_restoreWarningMessage =>
      'بازیابی اطلاعات، تمام داده‌های فعلی را پاک کرده و اطلاعات فایل پشتیبان را جایگزین می‌کند. برنامه باید مجدداً راه‌اندازی شود. آیا ادامه می‌دهید؟';

  @override
  String get settings_restoreConfirmButton => 'تایید و بازیابی';

  @override
  String get settings_restoreSuccessTitle => 'بازیابی موفق';

  @override
  String get settings_restoreSuccessMessage => 'اطلاعات با موفقیت بازیابی شد.';

  @override
  String get settings_iUnderstandButton => 'متوجه شدم';

  @override
  String get settings_restoreErrorMessage =>
      'خطا در بازیابی یا فایلی انتخاب نشد.';

  @override
  String get createInvoice_title => 'ایجاد فاکتور جدید';

  @override
  String get createInvoice_exitConfirmTitle => 'تایید خروج';

  @override
  String get createInvoice_exitConfirmMessage =>
      'آیتم‌هایی در فاکتور شما وجود دارد. آیا از خروج و لغو آنها مطمئن هستید؟';

  @override
  String get createInvoice_stay => 'ماندن';

  @override
  String get createInvoice_exit => 'خروج';

  @override
  String get createInvoice_successSnackbar => 'فاکتور با موفقیت ایجاد شد!';

  @override
  String get createInvoice_initializing => 'در حال آماده‌سازی...';

  @override
  String get createInvoice_addItemButton => 'افزودن کالا به فاکتور';

  @override
  String get createInvoice_availableItems => 'کالاهای موجود';

  @override
  String createInvoice_inStock(Object quantity) {
    return 'موجودی: $quantity';
  }

  @override
  String get createInvoice_currentInvoice => 'فاکتور فعلی';

  @override
  String get createInvoice_noItemsSelected => 'هیچ کالایی انتخاب نشده است.';

  @override
  String createInvoice_itemSubtitle(Object price, Object quantity) {
    return '$quantity عدد × $price';
  }

  @override
  String get createInvoice_customerNameHint => 'نام مشتری (اختیاری)';

  @override
  String get createInvoice_total => 'جمع کل:';

  @override
  String get createInvoice_submitButton => 'ثبت فاکتور';

  @override
  String get dialog_deleteConfirmTitle => 'تایید حذف';

  @override
  String dialog_deleteConfirmMessage(Object itemName) {
    return 'آیا از حذف \"$itemName\" مطمئن هستید؟';
  }

  @override
  String get dialog_discardChangesTitle => 'نادیده گرفتن تغییرات؟';

  @override
  String get dialog_discardChangesMessage =>
      'تغییرات ذخیره نشده‌ای وجود دارد. آیا از بازگشت مطمئن هستید؟';

  @override
  String get global_stay => 'ماندن';

  @override
  String get global_discard => 'نادیده گرفتن';

  @override
  String get inventory_controls_searchHint => 'جستجو بر اساس نام...';

  @override
  String get inventory_controls_sortByNameAsc => 'نام (صعودی)';

  @override
  String get inventory_controls_sortByNameDesc => 'نام (نزولی)';

  @override
  String get inventory_controls_sortByQuantityAsc => 'تعداد (کم به زیاد)';

  @override
  String get inventory_controls_sortByQuantityDesc => 'تعداد (زیاد به کم)';

  @override
  String get global_image => 'تصویر';

  @override
  String get reports_search_by_name => 'جستجو بر اساس اسم...';

  @override
  String get reports_apply_filters => 'تایید فیلتر ها';

  @override
  String get global_print => 'چاپ';

  @override
  String get settings_stockValueCalculationTitle => 'محاسبه ارزش انبار';

  @override
  String get settings_stockValueCalculationPurchasePrice => 'بر اساس قیمت خرید';

  @override
  String get settings_stockValueCalculationSalePrice => 'بر اساس قیمت فروش';

  @override
  String get settings_exportDataTitle => 'خروجی دیتا (JSON)';

  @override
  String get settings_exportDataSubtitle =>
      'یک نسخه پشتیبان از اطلاعات خود به صورت فایل JSON ذخیره کنید.';

  @override
  String get settings_importDataTitle => 'ورود دیتا (JSON)';

  @override
  String get settings_importDataSubtitle =>
      'اطلاعات خود را از یک فایل پشتیبان JSON بازگردانید.';
}

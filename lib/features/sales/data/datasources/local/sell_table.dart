import 'package:drift/drift.dart';
import 'package:portable_accounting/features/inventory/data/datasources/local/inventory_table.dart';

// جدول اصلی برای نگهداری اطلاعات کلی فاکتورها

@DataClassName('InvoiceData')
class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  TextColumn get customerName => text().nullable()();

  RealColumn get totalPrice => real()();
}

// جدول برای نگهداری هر ردیف از فاکتور

@DataClassName('SaleItemData')
class SaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  // کلید خارجی برای اتصال به جدول فاکتورها
  IntColumn get invoiceId => integer().references(Invoices, #id)();

  // کلید خارجی برای اتصال به جدول انبار
  IntColumn get inventoryItemId => integer().references(InventoryItems, #id)();

  TextColumn get name => text()(); // نام کالا در لحظه فروش
  IntColumn get quantity => integer()(); // تعداد فروخته شده
  RealColumn get price => real()(); // قیمت در لحظه فروش
}

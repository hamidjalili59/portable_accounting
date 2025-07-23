import 'package:drift/drift.dart';
import 'package:portable_accounting/core/database/app_database.dart';

import 'sell_table.dart';

part 'sales_dao.g.dart';

@DriftAccessor(tables: [Invoices, SaleItems])
class SalesDao extends DatabaseAccessor<AppDatabase> with _$SalesDaoMixin {
  SalesDao(super.db);

  // یک فاکتور جدید درج می‌کند و ID آن را برمی‌گرداند
  Future<int> insertInvoice(InvoicesCompanion invoice) {
    return into(invoices).insert(invoice);
  }

  // لیستی از آیتم‌های فروخته شده را درج می‌کند
  Future<void> insertSaleItems(List<SaleItemsCompanion> items) {
    return batch((batch) {
      batch.insertAll(saleItems, items);
    });
  }

  // تمام فاکتورها را برمی‌گرداند
  Future<List<InvoiceData>> getAllInvoices() => select(invoices).get();

  // تمام آیتم‌های فروخته شده برای یک فاکتور خاص را برمی‌گرداند
  Future<List<SaleItemData>> getSaleItemsForInvoice(int invoiceId) {
    return (select(
      saleItems,
    )..where((tbl) => tbl.invoiceId.equals(invoiceId))).get();
  }

  // متد جدید برای خواندن فاکتورها در یک بازه زمانی
  Future<List<InvoiceData>> getInvoicesBetween(DateTime start, DateTime end) {
    return (select(invoices)
          ..where((tbl) => tbl.date.isBetween(Variable(start), Variable(end))))
        .get();
  }
}

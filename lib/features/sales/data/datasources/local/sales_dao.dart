import 'package:drift/drift.dart';
import 'package:portable_accounting/core/database/app_database.dart';

part 'sales_dao.g.dart';

@DriftAccessor(tables: [Invoices, SaleItems])
class SalesDao extends DatabaseAccessor<AppDatabase> with _$SalesDaoMixin {
  SalesDao(super.db);

  Future<int> insertInvoice(InvoicesCompanion invoice) {
    return into(attachedDatabase.invoices).insert(invoice);
  }

  Future<void> insertSaleItems(List<SaleItemsCompanion> items) {
    return batch((batch) {
      batch.insertAll(attachedDatabase.saleItems, items);
    });
  }

  Future<List<Invoice>> getAllInvoices() => select(attachedDatabase.invoices).get();

  Future<List<Invoice>> getFilteredInvoices({
    required DateTime start,
    required DateTime end,
    String? query,
  }) {
    var statement = select(attachedDatabase.invoices)
      ..where((tbl) => tbl.date.isBetween(Variable(start), Variable(end)));

    if (query != null && query.isNotEmpty) {
      statement.where((tbl) => tbl.customerName.isNotNull() & tbl.customerName.like('%$query%'));
    }

    return statement.get();
  }

  Future<List<SaleItem>> getSaleItemsForInvoice(int invoiceId) {
    return (select(attachedDatabase.saleItems)..where((tbl) => tbl.invoiceId.equals(invoiceId))).get();
  }

  Future<List<Invoice>> getInvoicesBetween(DateTime start, DateTime end) {
    return (select(attachedDatabase.invoices)..where((tbl) => tbl.date.isBetween(Variable(start), Variable(end)))).get();
  }
}
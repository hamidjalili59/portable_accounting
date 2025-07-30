import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/database/app_database.dart' as db;
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/features/inventory/data/datasources/local/inventory_dao.dart';
import 'package:portable_accounting/features/sales/data/datasources/local/sales_dao.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:portable_accounting/features/sales/domain/entities/sale_item.dart';
import 'package:portable_accounting/features/sales/domain/repositories/sell_repository.dart';

class SalesRepositoryImpl implements SalesRepository {
  final db.AppDatabase _db;
  final SalesDao _salesDao;
  final InventoryDao _inventoryDao;

  SalesRepositoryImpl({
    required db.AppDatabase db,
    required SalesDao salesDao,
    required InventoryDao inventoryDao,
  }) : _db = db,
       _salesDao = salesDao,
       _inventoryDao = inventoryDao;

  @override
  Future<Either<Failure, List<Invoice>>> getInvoicesByDateRange(
    DateTime start,
    DateTime end,
  ) async {
    try {
      // از متد جدید DAO برای فیلتر کردن استفاده می‌کنیم
      final invoicesData = await _salesDao.getInvoicesBetween(start, end);
      final List<Invoice> result = [];

      // این بخش مشابه متد getAllInvoices است و فاکتورها را به Entity تبدیل می‌کند
      for (final invoiceData in invoicesData) {
        final saleItemsData = await _salesDao.getSaleItemsForInvoice(
          invoiceData.id,
        );
        final saleItems = saleItemsData
            .map(
              (itemData) => SaleItem(
                id: itemData.id,
                inventoryItemId: itemData.inventoryItemId,
                name: itemData.name,
                quantity: itemData.quantity,
                price: itemData.price,
              ),
            )
            .toList();

        result.add(
          Invoice(
            id: invoiceData.id,
            date: invoiceData.date,
            items: saleItems,
            totalPrice: invoiceData.totalPrice,
            customerName: invoiceData.customerName,
          ),
        );
      }
      return Right(result);
    } catch (e) {
      return Left(
        DatabaseFailure(
          message: 'خطا در دریافت گزارش فاکتورها: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> createInvoice(Invoice invoice) async {
    try {
      await _db.transaction(() async {
        final invoiceCompanion = db.InvoicesCompanion(
          date: Value(invoice.date),
          totalPrice: Value(invoice.totalPrice),
          customerName: Value(invoice.customerName),
        );
        final invoiceId = await _salesDao.insertInvoice(invoiceCompanion);

        final saleItemsCompanions = invoice.items.map((item) {
          return db.SaleItemsCompanion(
            invoiceId: Value(invoiceId),
            inventoryItemId: Value(item.inventoryItemId),
            name: Value(item.name),
            quantity: Value(item.quantity),
            price: Value(item.price),
          );
        }).toList();
        await _salesDao.insertSaleItems(saleItemsCompanions);

        for (final item in invoice.items) {
          final currentItem = await (_inventoryDao.select(
            _inventoryDao.db.inventoryItems,
          )..where((tbl) => tbl.id.equals(item.inventoryItemId))).getSingle();

          final newQuantity = currentItem.quantity - item.quantity;
          if (newQuantity < 0) {
            throw Exception('موجودی کالای "${item.name}" کافی نیست.');
          }

          final updatedItem = currentItem.copyWith(quantity: newQuantity);
          await _inventoryDao.updateItem(updatedItem.toCompanion(false));
        }
      });
      return const Right(null);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'خطا در ثبت فاکتور: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Invoice>>> getAllInvoices() async {
    try {
      final invoicesData = await _salesDao.getAllInvoices();
      final List<Invoice> result = [];

      for (final invoiceData in invoicesData) {
        final saleItemsData = await _salesDao.getSaleItemsForInvoice(
          invoiceData.id,
        );

        final saleItems = saleItemsData
            .map(
              (itemData) => SaleItem(
                id: itemData.id,
                inventoryItemId: itemData.inventoryItemId,
                name: itemData.name,
                quantity: itemData.quantity,
                price: itemData.price,
              ),
            )
            .toList();

        result.add(
          Invoice(
            id: invoiceData.id,
            date: invoiceData.date,
            items: saleItems,
            totalPrice: invoiceData.totalPrice,
            customerName: invoiceData.customerName,
          ),
        );
      }
      return Right(result);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'خطا در دریافت فاکتورها: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Invoice>>> getInvoicesByDateRangeAndQuery({
    required DateTime start,
    required DateTime end,
    String? query,
  }) async {
    try {
      // Call the DAO method with the filters
      final invoicesData = await _salesDao.getFilteredInvoices(
        start: start,
        end: end,
        query: query,
      );

      final List<Invoice> result = [];

      // This logic converts the database data to your app's domain objects
      for (final invoiceData in invoicesData) {
        final saleItemsData = await _salesDao.getSaleItemsForInvoice(
          invoiceData.id,
        );
        final saleItems = saleItemsData
            .map(
              (itemData) => SaleItem(
                id: itemData.id,
                inventoryItemId: itemData.inventoryItemId,
                name: itemData.name,
                quantity: itemData.quantity,
                price: itemData.price,
              ),
            )
            .toList();

        result.add(
          Invoice(
            id: invoiceData.id,
            date: invoiceData.date,
            items: saleItems,
            totalPrice: invoiceData.totalPrice,
            customerName: invoiceData.customerName,
          ),
        );
      }
      return Right(result);
    } catch (e) {
      return Left(
        DatabaseFailure(
          message: 'Error fetching filtered invoices: ${e.toString()}',
        ),
      );
    }
  }
}

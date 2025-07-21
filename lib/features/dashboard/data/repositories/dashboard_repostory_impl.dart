import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/database/app_database.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:portable_accounting/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final AppDatabase _db;

  DashboardRepositoryImpl({required AppDatabase db}) : _db = db;

  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    try {
      // خواندن تمام آیتم‌های فروخته شده و فاکتورها
      final allSaleItems = await _db.select(_db.saleItems).get();
      final allInvoices = await _db.select(_db.invoices).get();

      if (allSaleItems.isEmpty) {
        // اگر فروشی ثبت نشده، داده‌های صفر برمی‌گردانیم
        return Right(DashboardData(
          totalRevenue: 0,
          totalCost: 0,
          totalProfit: 0,
          lastWeekProfit: [],
        ));
      }

      // ۱. محاسبه کل درآمد
      final totalRevenue = allSaleItems.fold<double>(
        0,
            (sum, item) => sum + (item.quantity * item.price),
      );

      // ۲. محاسبه کل هزینه (قیمت تمام شده کالاهای فروخته شده)
      double totalCost = 0;
      for (final saleItem in allSaleItems) {
        // قیمت خرید کالا را از جدول انبار پیدا می‌کنیم
        final inventoryItem = await (_db.select(_db.inventoryItems)
          ..where((tbl) => tbl.id.equals(saleItem.inventoryItemId)))
            .getSingleOrNull();

        if (inventoryItem != null) {
          totalCost += saleItem.quantity * inventoryItem.purchasePrice;
        }
      }

      // ۳. محاسبه سود خالص
      final totalProfit = totalRevenue - totalCost;

      // ۴. محاسبه سود ۷ روز گذشته برای نمودار
      final lastWeekProfit = _calculateLastWeekProfit(allInvoices, allSaleItems);

      return Right(DashboardData(
        totalRevenue: totalRevenue,
        totalCost: totalCost,
        totalProfit: totalProfit,
        lastWeekProfit: await lastWeekProfit,
      ));
    } catch (e) {
      return Left(DatabaseFailure(message: 'خطا در محاسبه داده‌های داشبورد: ${e.toString()}'));
    }
  }

  // متد کمکی برای محاسبه سود روزانه
  Future<List<DailyProfit>> _calculateLastWeekProfit(
      List<InvoiceData> allInvoices, List<SaleItemData> allSaleItems) async {
    final Map<DateTime, double> dailyProfitMap = {};
    final today = DateTime.now();
    final sevenDaysAgo = today.subtract(const Duration(days: 7));

    // فاکتورهای ۷ روز گذشته را فیلتر می‌کنیم
    final recentInvoices = allInvoices.where((inv) => inv.date.isAfter(sevenDaysAgo));

    for (final invoice in recentInvoices) {
      final dateOnly = DateTime(invoice.date.year, invoice.date.month, invoice.date.day);
      final itemsForThisInvoice = allSaleItems.where((item) => item.invoiceId == invoice.id);

      double dailyRevenue = itemsForThisInvoice.fold(0, (sum, item) => sum + (item.quantity * item.price));
      double dailyCost = 0;

      for (final saleItem in itemsForThisInvoice) {
        final inventoryItem = await (_db.select(_db.inventoryItems)
          ..where((tbl) => tbl.id.equals(saleItem.inventoryItemId)))
            .getSingleOrNull();
        if (inventoryItem != null) {
          dailyCost += saleItem.quantity * inventoryItem.purchasePrice;
        }
      }

      dailyProfitMap.update(
        dateOnly,
            (existingProfit) => existingProfit + (dailyRevenue - dailyCost),
        ifAbsent: () => dailyRevenue - dailyCost,
      );
    }

    return dailyProfitMap.entries.map((e) => DailyProfit(date: e.key, profit: e.value)).toList()
      ..sort((a,b) => a.date.compareTo(b.date));
  }
}
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
      // Fetch all necessary data from the database
      final allSaleItems = await _db.select(_db.saleItems).get();
      final allInvoices = await _db.select(_db.invoices).get();

      // If there's no data, return an empty dashboard state
      if (allSaleItems.isEmpty) {
        return Right(
          DashboardData(
            totalRevenue: 0,
            totalCost: 0,
            totalProfit: 0,
            lastWeekProfit: [],
            totalSalesCount: 0,
            topSellingProducts: [],
          ),
        );
      }

      // --- Perform Calculations ---

      // 1. Calculate total revenue from all sold items
      final totalRevenue = allSaleItems.fold<double>(
        0,
        (sum, item) => sum + (item.quantity * item.price),
      );

      // 2. Calculate total cost of goods sold (COGS)
      double totalCost = 0;
      for (final saleItem in allSaleItems) {
        // Find the original purchase price from the inventory table
        final inventoryItem =
            await (_db.select(_db.inventoryItems)
                  ..where((tbl) => tbl.id.equals(saleItem.inventoryItemId)))
                .getSingleOrNull();

        if (inventoryItem != null) {
          totalCost += saleItem.quantity * inventoryItem.purchasePrice;
        }
      }

      // 3. Calculate net profit
      final totalProfit = totalRevenue - totalCost;

      // 4. Calculate total number of sales (invoices)
      final totalSalesCount = allInvoices.length;

      // 5. Calculate top 5 selling products by quantity
      final productSales =
          <int, int>{}; // Map<inventoryItemId, totalQuantitySold>
      for (final item in allSaleItems) {
        productSales.update(
          item.inventoryItemId,
          (value) => value + item.quantity,
          ifAbsent: () => item.quantity,
        );
      }

      final sortedProducts = productSales.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      final topSellingProducts = <TopSellingProduct>[];
      for (final entry in sortedProducts.take(5)) {
        final inventoryItem = await (_db.select(
          _db.inventoryItems,
        )..where((tbl) => tbl.id.equals(entry.key))).getSingleOrNull();
        if (inventoryItem != null) {
          topSellingProducts.add(
            TopSellingProduct(
              name: inventoryItem.name,
              quantitySold: entry.value,
            ),
          );
        }
      }

      // 6. Calculate profit for the last 7 days for the chart
      final lastWeekProfit = await _calculateLastWeekProfit(
        allInvoices,
        allSaleItems,
      );

      // Return the complete dashboard data object
      return Right(
        DashboardData(
          totalRevenue: totalRevenue,
          totalCost: totalCost,
          totalProfit: totalProfit,
          lastWeekProfit: lastWeekProfit,
          totalSalesCount: totalSalesCount,
          topSellingProducts: topSellingProducts,
        ),
      );
    } catch (e) {
      return Left(
        DatabaseFailure(
          message: 'Error calculating dashboard data: ${e.toString()}',
        ),
      );
    }
  }

  /// Helper method to calculate daily profit for the last 7 days.
  Future<List<DailyProfit>> _calculateLastWeekProfit(
    List<Invoice> allInvoices,
    List<SaleItem> allSaleItems,
  ) async {
    // Step 1: Create a map with all of the last 7 days initialized to zero profit.
    final Map<DateTime, double> dailyProfitMap = {};
    final today = DateTime.now();
    for (int i = 6; i >= 0; i--) {
      final date = today.subtract(Duration(days: i));
      // Use a date without time for consistent grouping
      final dateOnly = DateTime(date.year, date.month, date.day);
      dailyProfitMap[dateOnly] = 0.0;
    }

    // Step 2: Filter for invoices within the last 7 days
    final sevenDaysAgo = today.subtract(const Duration(days: 7));
    final recentInvoices = allInvoices.where(
      (inv) => inv.date.isAfter(sevenDaysAgo),
    );

    // Step 3: Iterate through actual sales and update the profit for the corresponding day
    for (final invoice in recentInvoices) {
      final dateOnly = DateTime(
        invoice.date.year,
        invoice.date.month,
        invoice.date.day,
      );
      final itemsForThisInvoice = allSaleItems.where(
        (item) => item.invoiceId == invoice.id,
      );

      double dailyRevenue = itemsForThisInvoice.fold(
        0,
        (sum, item) => sum + (item.quantity * item.price),
      );
      double dailyCost = 0;

      for (final saleItem in itemsForThisInvoice) {
        final inventoryItem =
            await (_db.select(_db.inventoryItems)
                  ..where((tbl) => tbl.id.equals(saleItem.inventoryItemId)))
                .getSingleOrNull();
        if (inventoryItem != null) {
          dailyCost += saleItem.quantity * inventoryItem.purchasePrice;
        }
      }

      // Update the map with the calculated profit for that day
      dailyProfitMap.update(
        dateOnly,
        (existingProfit) => existingProfit + (dailyRevenue - dailyCost),
        ifAbsent: () => dailyRevenue - dailyCost,
      );
    }

    // Step 4: Convert the map to a sorted list
    return dailyProfitMap.entries
        .map((entry) => DailyProfit(date: entry.key, profit: entry.value))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }
}

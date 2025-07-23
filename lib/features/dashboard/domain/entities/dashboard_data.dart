import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';

@freezed
class DashboardData with _$DashboardData {
  DashboardData({
    required this.totalRevenue,
    required this.totalCost,
    required this.totalProfit,
    required this.lastWeekProfit,
    required this.totalSalesCount,
    required this.topSellingProducts,
  });

  @override
  final double totalRevenue;
  @override
  final double totalCost;
  @override
  final double totalProfit;
  @override
  final List<DailyProfit> lastWeekProfit;
  @override
  final int totalSalesCount;
  @override
  final List<TopSellingProduct> topSellingProducts;
}

@freezed
class DailyProfit with _$DailyProfit {
  DailyProfit({required this.date, required this.profit});

  @override
  final DateTime date;
  @override
  final double profit;
}

@freezed
class TopSellingProduct with _$TopSellingProduct {
  TopSellingProduct({required this.name, required this.quantitySold});

  @override
  final String name;
  @override
  final int quantitySold;
}

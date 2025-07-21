import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:portable_accounting/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:portable_accounting/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('داشبورد')),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (data) => SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ویجت‌های نمایش آمار کلی
                  _buildStatsCards(context, data),
                  const SizedBox(height: 24),
                  // نمودار سود هفتگی
                  _buildChartCard(context, data.lastWeekProfit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context, DashboardData data) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        _StatCard(
          title: 'کل درآمد',
          value: '${data.totalRevenue.toStringAsFixed(0)} تومان',
          icon: Icons.trending_up,
          color: Colors.green,
        ),
        _StatCard(
          title: 'کل هزینه',
          value: '${data.totalCost.toStringAsFixed(0)} تومان',
          icon: Icons.trending_down,
          color: Colors.red,
        ),
        _StatCard(
          title: 'سود خالص',
          value: '${data.totalProfit.toStringAsFixed(0)} تومان',
          icon: Icons.attach_money,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildChartCard(BuildContext context, List<DailyProfit> weeklyProfit) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'سود ۷ روز گذشته',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          // نمایش تاریخ در محور افقی
                          final day = weeklyProfit[value.toInt()].date;
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(DateFormat('M/d').format(day)),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: weeklyProfit.asMap().entries.map((e) {
                        return FlSpot(e.key.toDouble(), e.value.profit);
                      }).toList(),
                      isCurved: true,
                      color: Theme.of(context).primaryColor,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// یک ویجت کوچک برای نمایش کارت‌های آمار
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}

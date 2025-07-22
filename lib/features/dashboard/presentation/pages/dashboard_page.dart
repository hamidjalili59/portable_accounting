import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:portable_accounting/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MediaQuery.of(context).size.width < ResponsiveLayout.mobileBreakpoint
          ? AppBar(title: const Text('داشبورد'))
          : null, // در دسکتاپ، عنوان در بدنه نمایش داده می‌شود
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (data) => ResponsiveLayout(
              mobileBody: _buildMobileLayout(context, data),
              desktopBody: _buildDesktopLayout(context, data),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, DashboardData data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildStatsCards(data, isMobile: true),
          const SizedBox(height: 24),
          _buildChartCard(context, data.lastWeekProfit),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, DashboardData data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('داشبورد', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          _buildStatsCards(data, isMobile: false),
          const SizedBox(height: 24),
          _buildChartCard(context, data.lastWeekProfit),
        ],
      ),
    );
  }

  Widget _buildStatsCards(DashboardData data, {required bool isMobile}) {
    final cards = [
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
    ];

    if (isMobile) {
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: cards,
      );
    } else {
      // در دسکتاپ، کارت‌ها را در یک ردیف با فضای مساوی قرار می‌دهیم
      return Row(children: cards.map((card) => Expanded(child: card)).toList());
    }
  }

  Widget _buildChartCard(BuildContext context, List<DailyProfit> weeklyProfit) {
    if (weeklyProfit.isEmpty) {
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const SizedBox(
          height: 200,
          child: Center(
            child: Text('داده‌ای برای نمایش نمودار سود وجود ندارد.'),
          ),
        ),
      );
    }
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8), // پدینگ برای زیبایی
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
                        interval: 1, // برای نمایش تمام برچسب‌ها
                        getTitlesWidget: (value, meta) {
                          // نمایش تاریخ در محور افقی
                          if (value.toInt() >= weeklyProfit.length) {
                            return const SizedBox.shrink();
                          }
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

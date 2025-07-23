import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import '../../domain/entities/dashboard_data.dart';

/// A card widget that displays the weekly profit trend using a line chart.
/// It includes interactive tooltips and readable axis labels.
class ProfitChartCard extends StatelessWidget {
  final List<DailyProfit> weeklyProfit;

  const ProfitChartCard({super.key, required this.weeklyProfit});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // If there is no data, show a helpful message instead of an empty chart.
    if (weeklyProfit.isEmpty) {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          height: 300,
          child: Center(child: Text(l10n.dashboard_noChartData)),
        ),
      );
    }

    // If data exists, build the chart.
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.dashboard_last7DaysProfit,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  // Configure interactive tooltips on touch/hover.
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          final dayData = weeklyProfit[spot.x.toInt()];
                          return LineTooltipItem(
                            '${DateFormat('MMM d').format(dayData.date)}\n${dayData.profit.toStringAsFixed(0)}',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    // Y-Axis (Left) Titles
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            NumberFormat.compact().format(value),
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    // X-Axis (Bottom) Titles
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= weeklyProfit.length) {
                            return const SizedBox.shrink();
                          }
                          final day = weeklyProfit[value.toInt()].date;
                          return SideTitleWidget(
                            meta: meta,
                            space: 4,
                            child: Text(
                              DateFormat('E').format(day),
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  // The actual line data for the chart.
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

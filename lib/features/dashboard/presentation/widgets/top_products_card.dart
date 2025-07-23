import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import '../../domain/entities/dashboard_data.dart';

class TopProductsCard extends StatelessWidget {
  final List<TopSellingProduct> products;

  const TopProductsCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Best-Selling Items',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            if (products.isEmpty)
              const Center(
                child: Text('No sales data available to show top products.'),
              )
            else
              // Use ResponsiveLayout to change the layout based on screen size
              ResponsiveLayout(
                mobileBody: _buildMobileLayout(),
                desktopBody: _buildDesktopLayout(),
              ),
          ],
        ),
      ),
    );
  }

  /// The layout for desktop screens (side-by-side).
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        SizedBox(height: 150, width: 150, child: _buildPieChart()),
        const SizedBox(width: 24),
        Expanded(child: _buildLegend()),
      ],
    );
  }

  /// The layout for mobile screens (stacked vertically).
  Widget _buildMobileLayout() {
    return Column(
      children: [
        SizedBox(height: 150, width: 150, child: _buildPieChart()),
        const SizedBox(height: 24),
        _buildLegend(),
      ],
    );
  }

  /// Builds the Pie Chart widget.
  Widget _buildPieChart() {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
    ];
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: List.generate(products.length, (i) {
          final product = products[i];
          return PieChartSectionData(
            color: colors[i % colors.length],
            value: product.quantitySold.toDouble(),
            title: '${product.quantitySold}',
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        }),
      ),
    );
  }

  /// Builds the legend for the Pie Chart.
  Widget _buildLegend() {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(products.length, (i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                color: colors[i % colors.length],
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(products[i].name)),
            ],
          ),
        );
      }),
    );
  }
}

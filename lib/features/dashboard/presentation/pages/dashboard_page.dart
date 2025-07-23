import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/l10n/app_localizations.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/dashboard/presentation/widgets/profit_chart_card.dart';
import '../../domain/entities/dashboard_data.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/stat_card.dart';
import '../widgets/top_products_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar:
          MediaQuery.of(context).size.width < ResponsiveLayout.mobileBreakpoint
          ? AppBar(title: Text(l10n.page_dashboard))
          : null,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (data) {
              // The main content is now a clean, readable layout.
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (MediaQuery.of(context).size.width >=
                        ResponsiveLayout.mobileBreakpoint)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          l10n.page_dashboard,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),

                    // Main Stats Grid
                    _buildStatsGrid(context, data, l10n),
                    const SizedBox(height: 24),

                    // The two charts
                    ResponsiveLayout(
                      mobileBody: Column(
                        children: [
                          ProfitChartCard(weeklyProfit: data.lastWeekProfit),
                          const SizedBox(height: 24),
                          TopProductsCard(products: data.topSellingProducts),
                        ],
                      ),
                      desktopBody: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ProfitChartCard(
                              weeklyProfit: data.lastWeekProfit,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: TopProductsCard(
                              products: data.topSellingProducts,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // A helper to build the stats grid responsively.
  Widget _buildStatsGrid(
    BuildContext context,
    DashboardData data,
    AppLocalizations l10n,
  ) {
    final currencyUnit = context.watch<CurrencyCubit>().state;

    final stats = [
      StatCard(
        title: l10n.dashboard_netProfit,
        value: data.totalProfit.formatAsCurrency(currencyUnit),
        icon: Icons.attach_money,
        color: Colors.blue,
      ),
      StatCard(
        title: l10n.dashboard_totalRevenue,
        value: data.totalRevenue.formatAsCurrency(currencyUnit),
        icon: Icons.trending_up,
        color: Colors.green,
      ),
      StatCard(
        title: l10n.dashboard_totalCost,
        value: data.totalCost.formatAsCurrency(currencyUnit),
        icon: Icons.trending_down,
        color: Colors.red,
      ),
      StatCard(
        title: l10n.dashboard_totalSales,
        value: '${data.totalSalesCount}',
        icon: Icons.point_of_sale,
        color: Colors.orange,
      ),
    ];

    // For desktop, we use a Row with Expanded children.
    if (MediaQuery.of(context).size.width >=
        ResponsiveLayout.mobileBreakpoint) {
      return Row(
        children: stats
            .map(
              (card) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: card,
                ),
              ),
            )
            .toList(),
      );
    }

    // For mobile, we use a Wrap for maximum flexibility.
    return Wrap(
      spacing: 16, // Horizontal space between cards
      runSpacing: 16, // Vertical space between rows
      alignment: WrapAlignment.center,
      children: stats.map((card) {
        // We calculate a flexible width to ensure two cards fit if possible,
        // but they can shrink or grow as needed.
        final screenWidth = MediaQuery.of(context).size.width;
        final cardWidth =
            (screenWidth - 48) / 2; // (Screen width - total padding) / 2
        return SizedBox(width: cardWidth, child: card);
      }).toList(),
    );
  }
}

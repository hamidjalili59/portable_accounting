import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/services/settings_cubit.dart';
import '../../domain/entities/inventory_item.dart';

/// A widget that displays a summary of the inventory.
///
/// It shows key statistics like the number of unique items and the total
/// stock value, providing a quick overview for the user. The stock value
/// calculation is dynamically updated based on user settings.
class InventorySummaryHeader extends StatelessWidget {
  final List<InventoryItem> items;

  const InventorySummaryHeader({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    // Get instances of localization and state cubits from the context.
    final l10n = context.l10n;
    final currencyUnit = context.watch<CurrencyCubit>().state;
    final stockValueSetting = context.watch<SettingsCubit>().state;

    // --- Calculations ---

    // Calculate the total number of unique items in the inventory.
    final totalUniqueItems = items.length;

    // Dynamically calculate the total stock value based on the user's setting.
    final totalStockValue = items.fold<double>(0, (sum, item) {
      final price =
          stockValueSetting == StockValueCalculation.basedOnPurchasePrice
          ? item.purchasePrice
          : item.salePrice;
      return sum + (item.quantity * price);
    });

    // --- UI ---

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Stat for unique items.
            _buildStat(
              context: context,
              label: l10n.inventory_unique_items,
              value: totalUniqueItems.toString(),
              icon: Icons.inventory_2_outlined,
            ),

            // A vertical divider for better separation.
            const SizedBox(height: 50, child: VerticalDivider()),

            // Stat for total stock value.
            _buildStat(
              context: context,
              label: l10n.inventory_total_stock_value,
              value: totalStockValue.formatAsCurrency(currencyUnit),
              icon: Icons.monetization_on_outlined,
            ),
          ],
        ),
      ),
    );
  }

  /// A helper widget to build a single statistic block to avoid code repetition.
  Widget _buildStat({
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

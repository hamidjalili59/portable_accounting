import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../core/widgets/empty_state_widget.dart';
import '../../domain/entities/inventory_item.dart';
import 'inventory_data_source.dart';

/// Displays the entire UI for the desktop view of the inventory.
///
/// This widget includes the header, action buttons, and the data grid.
/// It receives the item list and action callbacks from the parent page.
class InventoryDesktopView extends StatelessWidget {
  final List<InventoryItem> items;
  final VoidCallback onAddItem;
  final Function(InventoryItem) onEditItem;
  final Function(InventoryItem) onDeleteItem;
  final CurrencyUnit currencyUnit;

  const InventoryDesktopView({
    super.key,
    required this.items,
    required this.currencyUnit,
    required this.onAddItem,
    required this.onEditItem,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // If the list is empty, show the empty state widget.
    if (items.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.inventory_2_outlined,
        title: l10n.inventory_emptyStateTitle,
        message: l10n.inventory_emptyStateMessage,
        buttonText: l10n.inventory_addNewItem,
        onButtonPressed: onAddItem,
      );
    }

    // If there are items, build the main view.
    final inventoryDataSource = InventoryDataSource(
      inventoryItems: items,
      currencyUnit: currencyUnit,
      onEdit: onEditItem,
      onDelete: onDeleteItem,
      l10n: l10n,
    );

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with title and main action buttons.
          Row(
            children: [
              Text(
                l10n.inventory_title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              FilledButton.icon(
                icon: const Icon(Icons.point_of_sale_outlined),
                label: Text(l10n.inventory_newSale),
                onPressed: () => context.push('/create-invoice'),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                icon: const Icon(Icons.add),
                label: Text(l10n.inventory_addNewItem),
                onPressed: onAddItem,
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // The interactive data grid.
          Expanded(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).dividerColor),
              ),
              clipBehavior: Clip.antiAlias,
              child: SfDataGrid(
                source: inventoryDataSource,
                columnWidthMode: ColumnWidthMode.fill,
                allowSorting: true,
                gridLinesVisibility: GridLinesVisibility.horizontal,
                headerGridLinesVisibility: GridLinesVisibility.horizontal,
                headerRowHeight: 56,
                rowHeight: 64,
                columns: <GridColumn>[
                  GridColumn(
                    columnName: 'image',
                    label: Center(child: Text(l10n.global_image)),
                    width: 100,
                    columnWidthMode: ColumnWidthMode.none,
                  ),
                  GridColumn(
                    columnName: 'name',
                    label: Center(child: Text(l10n.inventory_item_name)),
                  ),
                  GridColumn(
                    columnName: 'quantity',
                    label: Center(child: Text(l10n.inventory_quantity)),
                  ),
                  GridColumn(
                    columnName: 'purchasePrice',
                    label: Center(child: Text(l10n.inventory_purchase_price)),
                  ),
                  GridColumn(
                    columnName: 'salePrice',
                    label: Center(child: Text(l10n.inventory_sale_price)),
                  ),
                  GridColumn(
                    columnName: 'actions',
                    label: Center(child: Text(l10n.global_actions)),
                    width: 120,
                    columnWidthMode: ColumnWidthMode.none,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

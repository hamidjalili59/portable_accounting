import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    // If the list is empty, show the empty state widget.
    if (items.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.inventory_2_outlined,
        title: 'Your inventory is empty!',
        message: 'Add your first item to get started.',
        buttonText: 'Add New Item',
        onButtonPressed: onAddItem,
      );
    }

    // If there are items, build the main view.
    final inventoryDataSource = InventoryDataSource(
      inventoryItems: items,
      currencyUnit: currencyUnit,
      onEdit: onEditItem,
      onDelete: onDeleteItem,
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
                'Inventory Management',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              FilledButton.icon(
                icon: const Icon(Icons.point_of_sale_outlined),
                label: const Text('New Sale'),
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
                label: const Text('Add New Item'),
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
                    label: const Center(child: Text('Image')),
                    width: 100,
                    columnWidthMode: ColumnWidthMode.none,
                  ),
                  GridColumn(
                    columnName: 'name',
                    label: const Center(child: Text('Item Name')),
                  ),
                  GridColumn(
                    columnName: 'quantity',
                    label: const Center(child: Text('Quantity')),
                  ),
                  GridColumn(
                    columnName: 'purchasePrice',
                    label: const Center(child: Text('Purchase Price')),
                  ),
                  GridColumn(
                    columnName: 'salePrice',
                    label: const Center(child: Text('Sale Price')),
                  ),
                  GridColumn(
                    columnName: 'actions',
                    label: const Center(child: Text('Actions')),
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

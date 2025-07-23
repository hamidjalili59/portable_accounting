import 'package:flutter/material.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';

import '../../../../core/widgets/empty_state_widget.dart';
import '../../domain/entities/inventory_item.dart';
import 'inventory_list_item.dart';

/// Displays the list of inventory items specifically for mobile layouts.
///
/// This widget shows a user-friendly list of cards and displays a helpful
/// message when the inventory is empty.
class InventoryMobileView extends StatelessWidget {
  final List<InventoryItem> items;
  final void Function(InventoryItem item) onDeleteItem;
  final void Function(InventoryItem item) onEditItem;

  const InventoryMobileView({
    super.key,
    required this.items,
    required this.onDeleteItem,
    required this.onEditItem,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // If the list is empty, show the custom empty state widget.
    if (items.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.inventory_2_outlined,
        title: l10n.inventory_emptyStateTitle,
        message: l10n.inventory_emptyStateMessage,
        // We don't add a button here because the FloatingActionButton
        // on the main page already serves this purpose.
      );
    }

    // If there are items, display them in a ListView.
    return ListView.builder(
      // Add padding to the bottom to prevent the FloatingActionButton
      // from covering the last item.
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return InventoryListItem(
          item: item,
          onEdit: () => onEditItem(item),
          onDelete: () => onDeleteItem(item),
        );
      },
    );
  }
}

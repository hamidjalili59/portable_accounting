import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import '../../../inventory/domain/entities/inventory_item.dart';
import '../bloc/sell_bloc.dart';

/// A widget that displays the list of available inventory items for selection.
class AvailableItemsList extends StatelessWidget {
  final List<InventoryItem> items;

  const AvailableItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            l10n.createInvoice_availableItems,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isOutOfStock = item.quantity <= 0;
              return ListTile(
                title: Text(item.name),
                subtitle: Text(l10n.createInvoice_inStock(item.quantity)),
                trailing: Text(item.salePrice.toStringAsFixed(0)),
                enabled: !isOutOfStock,
                onTap: isOutOfStock
                    ? null
                    : () {
                        context.read<SalesBloc>().add(
                          SalesEvent.addItemToInvoice(item),
                        );
                        // On mobile, closes the bottom sheet after adding
                        if (MediaQuery.of(context).size.width <
                            ResponsiveLayout.mobileBreakpoint) {
                          Navigator.of(context).pop();
                        }
                      },
              );
            },
          ),
        ),
      ],
    );
  }
}

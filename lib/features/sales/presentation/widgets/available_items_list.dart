import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/sales/domain/entities/sale_item.dart';
import '../../../inventory/domain/entities/inventory_item.dart';
import '../bloc/sell_bloc.dart';

/// A widget that displays the list of available inventory items for selection.
class AvailableItemsList extends StatelessWidget {
  final List<InventoryItem> items;
  final List<SaleItem> invoiceItems;

  const AvailableItemsList({
    super.key,
    required this.items,
    required this.invoiceItems,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currencyUnit = context.watch<CurrencyCubit>().state;
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
              final inventoryItem = items[index];

              // Find this item in the cart to calculate remaining stock
              final itemInCart = invoiceItems.firstWhere(
                (saleItem) => saleItem.inventoryItemId == inventoryItem.id,
                orElse: () => SaleItem(
                  id: 0,
                  inventoryItemId: 0,
                  name: '',
                  quantity: 0,
                  price: 0,
                ),
              );

              final remainingStock =
                  inventoryItem.quantity - itemInCart.quantity;
              final canBeAdded = remainingStock > 0;

              return ListTile(
                title: Text(inventoryItem.name),
                // The subtitle now shows the real-time available stock
                subtitle: Text(
                  'Available: $remainingStock / ${inventoryItem.quantity}',
                ),
                trailing: Text(
                  inventoryItem.salePrice.formatAsCurrency(currencyUnit),
                ),
                enabled: canBeAdded,
                onTap: canBeAdded
                    ? () {
                        context.read<SalesBloc>().add(
                          SalesEvent.addItemToInvoice(inventoryItem),
                        );
                        // On mobile, closes the bottom sheet after adding
                        if (MediaQuery.of(context).size.width <
                            ResponsiveLayout.mobileBreakpoint) {
                          Navigator.of(context).pop();
                        }
                      }
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

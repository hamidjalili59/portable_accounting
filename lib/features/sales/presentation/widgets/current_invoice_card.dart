import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import '../../domain/entities/sale_item.dart';
import '../bloc/sell_bloc.dart';

/// Displays the current list of items in the invoice, the total price,
/// and the final submission controls.
class CurrentInvoiceCard extends StatefulWidget {
  final List<SaleItem> items;
  final double totalPrice;
  final CurrencyUnit currencyUnit;

  const CurrentInvoiceCard({
    super.key,
    required this.items,
    required this.totalPrice,
    required this.currencyUnit,
  });

  @override
  State<CurrentInvoiceCard> createState() => _CurrentInvoiceCardState();
}

class _CurrentInvoiceCardState extends State<CurrentInvoiceCard> {
  late final TextEditingController _customerNameController;

  @override
  void initState() {
    super.initState();
    _customerNameController = TextEditingController();
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              l10n.createInvoice_currentInvoice,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: widget.items.isEmpty
                ? Center(child: Text(l10n.createInvoice_noItemsSelected))
                : ListView.builder(
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          l10n.createInvoice_itemSubtitle(
                            item.quantity,
                            item.price.formatAsCurrency(widget.currencyUnit),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () => context.read<SalesBloc>().add(
                            SalesEvent.removeItemFromInvoice(item),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _customerNameController,
                  decoration: InputDecoration(
                    labelText: l10n.createInvoice_customerNameHint,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.createInvoice_total,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      widget.totalPrice.toStringAsFixed(0),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: widget.items.isNotEmpty
                        ? () => context.read<SalesBloc>().add(
                            SalesEvent.submitInvoice(
                              customerName: _customerNameController.text,
                            ),
                          )
                        : null,
                    child: Text(l10n.createInvoice_submitButton),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

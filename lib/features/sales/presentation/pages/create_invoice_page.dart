import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/sales/domain/entities/sale_item.dart';
import '../bloc/sell_bloc.dart';
import '../widgets/available_items_list.dart';
import '../widgets/current_invoice_card.dart';

/// The main page for creating a new invoice.
///
/// This widget coordinates the overall layout and state management, using
/// child widgets for specific UI sections like the item list and the current invoice.
class CreateInvoicePage extends StatelessWidget {
  const CreateInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        // Determine if the user should be allowed to navigate back freely.
        final canPop = state.maybeWhen(
          loaded: (_, invoiceItems, _) => invoiceItems.isEmpty,
          orElse: () => true, // Allow back navigation in initial, loading, or success states.
        );

        return PopScope(
          canPop: canPop,
          onPopInvoked: (didPop) async {
            // If the pop was already successful, do nothing.
            if (didPop) return;

            // If the pop was blocked, show a confirmation dialog.
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Exit Confirmation'),
                content: const Text('You have items in your invoice. Are you sure you want to exit and discard them?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Stay'),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Exit'),
                  ),
                ],
              ),
            );

            // If the user confirmed, then programmatically pop the screen.
            if (shouldPop ?? false) {
              if (context.mounted) {
                context.pop();
              }
            }
          },
          child: Scaffold(
            appBar: AppBar(title: const Text('Create New Invoice')),
            body: BlocListener<SalesBloc, SalesState>(
              // This listener handles one-time events like showing SnackBars.
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invoice created successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    context.pop();
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                );
              },
              // This builder handles building the main UI based on the state.
              child: state.when(
                initial: () => const Center(child: Text("Initializing...")),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Center(child: Text(message)),
                success: () => const Center(child: Icon(Icons.check_circle, color: Colors.green, size: 50)),
                loaded: (availableItems, invoiceItems, totalPrice) {
                  // The main layout is now very clean and declarative.
                  return ResponsiveLayout(
                    mobileBody: _MobileInvoiceLayout(
                      availableItems: availableItems,
                      invoiceItems: invoiceItems,
                      totalPrice: totalPrice,
                    ),
                    desktopBody: _DesktopInvoiceLayout(
                      availableItems: availableItems,
                      invoiceItems: invoiceItems,
                      totalPrice: totalPrice,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Defines the desktop layout for the create invoice page.
class _DesktopInvoiceLayout extends StatelessWidget {
  final List<InventoryItem> availableItems;
  final List<SaleItem> invoiceItems;
  final double totalPrice;

  const _DesktopInvoiceLayout({
    required this.availableItems,
    required this.invoiceItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: AvailableItemsList(items: availableItems)),
        const VerticalDivider(width: 1),
        Expanded(flex: 3, child: CurrentInvoiceCard(items: invoiceItems, totalPrice: totalPrice)),
      ],
    );
  }
}

/// Defines the mobile layout for the create invoice page.
class _MobileInvoiceLayout extends StatelessWidget {
  final List<InventoryItem> availableItems;
  final List<SaleItem> invoiceItems;
  final double totalPrice;

  const _MobileInvoiceLayout({
    required this.availableItems,
    required this.invoiceItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CurrentInvoiceCard(items: invoiceItems, totalPrice: totalPrice)),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlinedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Add Item to Invoice'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<SalesBloc>(),
                  child: AvailableItemsList(items: availableItems),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
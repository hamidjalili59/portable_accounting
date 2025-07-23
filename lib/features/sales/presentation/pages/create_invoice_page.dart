import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
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
    final l10n = context.l10n;
    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        // Determine if the user should be allowed to navigate back freely.
        final canPop = state.maybeWhen(
          loaded: (_, invoiceItems, _) => invoiceItems.isEmpty,
          orElse: () =>
              true, // Allow back navigation in initial, loading, or success states.
        );

        return PopScope(
          canPop: canPop,
          onPopInvokedWithResult: (didPop, result) async {
            // If the pop was already successful, do nothing.
            if (didPop) return;

            // If the pop was blocked, show a confirmation dialog.
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.createInvoice_exitConfirmTitle),
                content: Text(l10n.createInvoice_exitConfirmMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(l10n.createInvoice_stay),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(l10n.createInvoice_exit),
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
            appBar: AppBar(title: Text(l10n.createInvoice_title)),
            body: BlocListener<SalesBloc, SalesState>(
              // This listener handles one-time events like showing SnackBars.
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.createInvoice_successSnackbar),
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
                initial: () =>
                    Center(child: Text(l10n.createInvoice_initializing)),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Center(child: Text(message)),
                success: () => const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
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
    final currencyUnit = context.watch<CurrencyCubit>().state;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: AvailableItemsList(items: availableItems)),
        const VerticalDivider(width: 1),
        Expanded(
          flex: 3,
          child: CurrentInvoiceCard(
            items: invoiceItems,
            currencyUnit: currencyUnit,
            totalPrice: totalPrice,
          ),
        ),
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
    final currencyUnit = context.watch<CurrencyCubit>().state;
    final l10n = context.l10n;
    return Column(
      children: [
        Expanded(
          child: CurrentInvoiceCard(
            items: invoiceItems,
            currencyUnit: currencyUnit,
            totalPrice: totalPrice,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlinedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: Text(l10n.createInvoice_addItemButton),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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

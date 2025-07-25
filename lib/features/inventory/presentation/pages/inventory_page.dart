import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/l10n/app_localizations.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/add_item_form.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/inventory_controls.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/inventory_desktop_view.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/inventory_mobile_view.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/inventory_summart_header.dart';

/// The main page for the Inventory feature.
///
/// This widget acts as a coordinator. It listens to the [InventoryBloc] state
/// and composes the UI using smaller, specialized child widgets. The logic for
/// showing dialogs and forms remains here, as it is a page-level concern.
class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      // The AppBar is only built for the mobile layout.
      appBar: _buildMobileAppBar(context, l10n),

      // The body uses a single BlocBuilder to handle all states.
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) =>
                Center(child: Text('${l10n.global_error}: $message')),

            // The 'loaded' state composes the entire UI from our refactored widgets.
            loaded: (originalItems, displayedItems, searchQuery, sortOrder) {
              final currencyUnit = context.watch<CurrencyCubit>().state;

              return Column(
                children: [
                  InventorySummaryHeader(items: originalItems),
                  InventoryControls(
                    searchQuery: searchQuery,
                    sortOrder: sortOrder,
                  ),
                  Expanded(
                    child: ResponsiveLayout(
                      mobileBody: InventoryMobileView(
                        items: displayedItems,
                        onEditItem: (item) =>
                            _showItemForm(context, item: item),
                        onDeleteItem: (item) =>
                            _showDeleteConfirmationDialog(context, item),
                      ),
                      desktopBody: InventoryDesktopView(
                        items: displayedItems,
                        currencyUnit: currencyUnit,
                        onAddItem: () => _showItemForm(context),
                        onEditItem: (item) =>
                            _showItemForm(context, item: item),
                        onDeleteItem: (item) =>
                            _showDeleteConfirmationDialog(context, item),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),

      // The FloatingActionButton is only built for the mobile layout.
      floatingActionButton: _buildMobileFab(context, l10n),
    );
  }

  /// Builds the AppBar for the mobile layout, returning null for desktop.
  PreferredSizeWidget? _buildMobileAppBar(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    if (MediaQuery.of(context).size.width >=
        ResponsiveLayout.mobileBreakpoint) {
      return null;
    }
    return AppBar(
      title: Text(l10n.page_inventory),
      actions: [
        IconButton(
          icon: const Icon(Icons.analytics_outlined),
          tooltip: l10n.page_dashboard,
          onPressed: () => context.push('/dashboard'),
        ),
        IconButton(
          icon: const Icon(Icons.point_of_sale_outlined),
          tooltip: l10n.inventory_newSale,
          onPressed: () => context.push('/create-invoice'),
        ),
        IconButton(
          icon: const Icon(Icons.receipt_long_outlined),
          tooltip: l10n.page_invoices,
          onPressed: () => context.push('/invoices'),
        ),
        IconButton(
          icon: const Icon(Icons.assessment_outlined),
          tooltip: l10n.page_reports,
          onPressed: () => context.push('/reports'),
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          tooltip: l10n.page_settings,
          onPressed: () => context.push('/settings'),
        ),
      ],
    );
  }

  /// Builds the FloatingActionButton for the mobile layout, returning null for desktop.
  Widget? _buildMobileFab(BuildContext context, AppLocalizations l10n) {
    if (MediaQuery.of(context).size.width >=
        ResponsiveLayout.mobileBreakpoint) {
      return null;
    }
    return FloatingActionButton(
      onPressed: () => _showItemForm(context),
      tooltip: l10n.inventory_addNewItem,
      child: const Icon(Icons.add),
    );
  }

  /// Displays the form for adding or editing an item.
  /// It intelligently shows a dialog on desktop and a modal bottom sheet on mobile.
  void _showItemForm(BuildContext context, {InventoryItem? item}) {
    final isDesktop =
        MediaQuery.of(context).size.width >= ResponsiveLayout.mobileBreakpoint;

    if (isDesktop) {
      showDialog(
        context: context,
        builder: (_) => BlocProvider.value(
          value: context.read<InventoryBloc>(),
          child: Dialog(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: AddItemForm(editingItem: item),
            ),
          ),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (_) => BlocProvider.value(
          value: context.read<InventoryBloc>(),
          child: AddItemForm(editingItem: item),
        ),
      );
    }
  }

  /// Displays the confirmation dialog before deleting an item.
  void _showDeleteConfirmationDialog(BuildContext context, InventoryItem item) {
    final l10n = context.l10n;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialog_deleteConfirmTitle),
        content: Text(l10n.dialog_deleteConfirmMessage(item.name)),
        actions: [
          TextButton(
            child: Text(l10n.global_cancel),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(l10n.global_delete),
            onPressed: () {
              context.read<InventoryBloc>().add(
                InventoryEvent.deleteItem(item.id),
              );
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}

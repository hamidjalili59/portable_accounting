import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/add_item_form.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/inventory_list_item.dart';
// ...

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileView = Scaffold(
      appBar: AppBar(
        title: const Text('موجودی انبار'),
        actions: [
          IconButton(
            icon: const Icon(Icons.point_of_sale_outlined),
            tooltip: 'فروش جدید',
            onPressed: () {
              context.push('/create-invoice');
            },
          ),
          IconButton(
            icon: const Icon(Icons.receipt_long_outlined),
            tooltip: 'لیست فاکتورها',
            onPressed: () {
              context.push('/invoices');
            },
          ),
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            tooltip: 'داشبورد',
            onPressed: () {
              context.push('/dashboard');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'تنظیمات',
            onPressed: () {
              context.push('/settings');
            },
          ),
        ],
      ),
      body: _buildMobileBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) {
              return BlocProvider.value(
                value: context.read<InventoryBloc>(),
                child: const AddItemForm(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );

    final desktopView = Scaffold(body: _buildDesktopBody());

    return ResponsiveLayout(mobileBody: mobileView, desktopBody: desktopView);
  }

  Widget _buildBodyContent() {
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (items) {
            return ResponsiveLayout(
              mobileBody: _buildMobileBody(items),
              desktopBody: _buildDesktopBody(items),
            );
          },
          error: (message) => Center(child: Text('خطا: $message')),
        );
      },
    );
  }

  Widget _buildMobileBody() {
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<InventoryBloc>().add(
              const InventoryEvent.loadInventory(),
            );
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (items) {
            if (items.isEmpty) {
              return const Center(
                child: Text(
                  'هیچ آیتمی در انبار وجود ندارد. برای افزودن روی + کلیک کنید.',
                ),
              );
            }
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InventoryListItem(item: items[index]);
              },
            );
          },
          error: (message) => Center(child: Text('خطا: $message')),
        );
      },
    );
  }

  Widget _buildDesktopBody() {
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        return state.when(
          loaded: (items) {
            if (items.isEmpty) {
              return const Center(
                child: Text(
                  'هیچ آیتمی در انبار وجود ندارد. برای افزودن روی + کلیک کنید.',
                ),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'مدیریت موجودی',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                      ),
                      FilledButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('افزودن کالای جدید'),
                        onPressed: () => _showItemForm(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('کالا')),
                        DataColumn(label: Text('تعداد')),
                        DataColumn(label: Text('قیمت خرید')),
                        DataColumn(label: Text('قیمت فروش')),
                        DataColumn(label: Text('عملیات')),
                      ],
                      rows: items.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(Text(item.name)),
                            DataCell(Text(item.quantity.toString())),
                            DataCell(
                              Text(item.purchasePrice.toStringAsFixed(0)),
                            ),
                            DataCell(Text(item.salePrice.toStringAsFixed(0))),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
          initial: () {
            context.read<InventoryBloc>().add(
              const InventoryEvent.loadInventory(),
            );
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text('خطا: $message')),
        );
      },
    );
  }

  void _showItemForm(BuildContext context, {InventoryItem? item}) {
    if (MediaQuery
        .of(context)
        .size
        .width >=
        ResponsiveLayout.mobileBreakpoint) {
      showDialog(
        context: context,
        builder: (_) =>
            BlocProvider.value(
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
        builder: (_) =>
            BlocProvider.value(
              value: context.read<InventoryBloc>(),
              child: AddItemForm(editingItem: item),
            ),
      );
    }
  }
}

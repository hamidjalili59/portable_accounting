import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/widgets/empty_state_widget.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/add_item_form.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/inventory_list_item.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // فقط یک Scaffold داریم
    return SafeArea(
      child: Scaffold(
        // AppBar فقط در حالت موبایل نمایش داده می‌شود
        appBar:
            MediaQuery.of(context).size.width < ResponsiveLayout.mobileBreakpoint
            ? AppBar(
                title: const Text('موجودی انبار'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.analytics_outlined),
                    tooltip: 'داشبورد',
                    onPressed: () => context.push('/dashboard'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.point_of_sale_outlined),
                    tooltip: 'فروش جدید',
                    onPressed: () => context.push('/create-invoice'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.receipt_long_outlined),
                    tooltip: 'لیست فاکتورها',
                    onPressed: () => context.push('/invoices'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    tooltip: 'تنظیمات',
                    onPressed: () => context.push('/settings'),
                  ),
                ],
              )
            : null,
        // فقط یک BlocBuilder داریم
        body: BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, state) {
            return state.when(
              // دیگر نیازی به ارسال ایونت در اینجا نیست
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text('خطا: $message')),
              // فقط در حالت loaded تصمیم می‌گیریم کدام UI را نشان دهیم
              loaded: (originalItems, displayedItems, searchQuery, sortOrder) {
                return ResponsiveLayout(
                  mobileBody: Column(
                    children: [
                      _buildControls(context, state as Loaded), // state را به متد پاس دهید
                      Expanded(child: _buildMobileListView(context, displayedItems)), // از displayedItems استفاده کنید
                    ],
                  ),
                  desktopBody: Column(
                    children: [
                      // برای دسکتاپ هم می‌توانید از همین کنترل‌ها استفاده کنید
                      _buildControls(context, state),
                      Expanded(child: _buildDesktopDataTable(context, displayedItems)), // از displayedItems استفاده کنید
                    ],
                  ),
                );
              },
            );
          },
        ),
        // دکمه شناور فقط در حالت موبایل نمایش داده می‌شود
        floatingActionButton:
            MediaQuery.of(context).size.width < ResponsiveLayout.mobileBreakpoint
            ? FloatingActionButton(
                onPressed: () => _showItemForm(context),
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
  }

  Widget _buildControls(BuildContext context, Loaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // فیلد جستجو
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'جستجو بر اساس نام...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              onChanged: (query) {
                context.read<InventoryBloc>().add(InventoryEvent.searchChanged(query));
              },
            ),
          ),
          const SizedBox(width: 16),
          // منوی مرتب‌سازی
          DropdownButton<InventorySortOrder>(
            value: state.sortOrder,
            items: const [
              DropdownMenuItem(value: InventorySortOrder.byNameAsc, child: Text('نام (صعودی)')),
              DropdownMenuItem(value: InventorySortOrder.byNameDesc, child: Text('نام (نزولی)')),
              DropdownMenuItem(value: InventorySortOrder.byQuantityAsc, child: Text('تعداد (کم به زیاد)')),
              DropdownMenuItem(value: InventorySortOrder.byQuantityDesc, child: Text('تعداد (زیاد به کم)')),
            ],
            onChanged: (value) {
              if (value != null) {
                context.read<InventoryBloc>().add(InventoryEvent.sortOrderChanged(value));
              }
            },
          ),
        ],
      ),
    );
  }

  // متدهای ساخت UI حالا خالص‌تر و بدون منطق اضافی هستند
  Widget _buildMobileListView(BuildContext context, List<InventoryItem> items) {
    if (items.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.inventory_2_outlined,
        title: 'انبار شما خالی است!',
        message: 'برای شروع، اولین کالای خود را به انبار اضافه کنید.',
        buttonText: 'افزودن کالای جدید',
        onButtonPressed: () => _showItemForm(context),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      // برای اینکه FAB روی آیتم آخر را نپوشاند
      itemCount: items.length,
      itemBuilder: (context, index) => InventoryListItem(item: items[index]),
    );
  }

  Widget _buildDesktopDataTable(
    BuildContext context,
    List<InventoryItem> items,
  ) {
    if (items.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.inventory_2_outlined,
        title: 'انبار شما خالی است!',
        message: 'برای شروع، اولین کالای خود را به انبار اضافه کنید.',
        buttonText: 'افزودن کالای جدید',
        onButtonPressed: () => _showItemForm(context),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InventorySummaryHeader(items: items),
          // هدر جدید و بهینه شده
          Row(
            children: [
              Text('مدیریت موجودی', style: Theme.of(context).textTheme.headlineMedium),
              const Spacer(), // فضای خالی بین عنوان و دکمه‌ها ایجاد می‌کند
              FilledButton.icon(
                icon: const Icon(Icons.point_of_sale_outlined),
                label: const Text('فروش جدید'),
                onPressed: () => context.push('/create-invoice'),
                style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('افزودن کالای جدید'),
                onPressed: () => _showItemForm(context),
                style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                // عرض ستون عکس را تنظیم می‌کنیم
                columnSpacing: 24,
                columns: const [
                  // ۱. ستون جدید برای عکس
                  DataColumn(label: Text('تصویر')),
                  DataColumn(label: Text('کالا')),
                  DataColumn(label: Text('تعداد')),
                  DataColumn(label: Text('قیمت خرید')),
                  DataColumn(label: Text('قیمت فروش')),
                  DataColumn(label: Text('عملیات')),
                ],
                rows: items.map((item) {
                  return DataRow(cells: [
                    // ۲. سلول جدید برای نمایش عکس
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: (item.imagePath != null &&
                                File(item.imagePath!).existsSync())
                                ? Image.file(File(item.imagePath!), fit: BoxFit.cover)
                                : Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.inventory_2_outlined,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(Text(item.name)),
                    DataCell(Text(item.quantity.toString())),
                    DataCell(Text(item.purchasePrice.toStringAsFixed(0))),
                    DataCell(Text(item.salePrice.toStringAsFixed(0))),
                    DataCell(Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _showItemForm(context, item: item)),
                        IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                _showDeleteConfirmationDialog(context, item)),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showItemForm(BuildContext context, {InventoryItem? item}) {
    if (MediaQuery.of(context).size.width >=
        ResponsiveLayout.mobileBreakpoint) {
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

  void _showDeleteConfirmationDialog(BuildContext context, InventoryItem item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تایید حذف'),
        content: Text('آیا از حذف کالای "${item.name}" مطمئن هستید؟'),
        actions: [
          TextButton(
            child: const Text('لغو'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
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
class _InventorySummaryHeader extends StatelessWidget {
  final List<InventoryItem> items;

  const _InventorySummaryHeader({required this.items});

  @override
  Widget build(BuildContext context) {
    // محاسبه آمار
    final totalUniqueItems = items.length;
    final totalStockValue = items.fold<double>(
        0, (sum, item) => sum + (item.quantity * item.purchasePrice));

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStat(context, 'تعداد اقلام', totalUniqueItems.toString()),
            _buildStat(context, 'ارزش کل انبار', '${totalStockValue.toStringAsFixed(0)} تومان'),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
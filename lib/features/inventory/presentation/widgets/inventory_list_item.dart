import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/add_item_form.dart';

class InventoryListItem extends StatelessWidget {
  final InventoryItem item;

  const InventoryListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name, style: Theme.of(context).textTheme.titleLarge),
                Row(
                  children: [
                    // دکمه ویرایش - فعلا خالی
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // همان متد showModalBottomSheet را برای ویرایش فراخوانی می‌کنیم
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (_) {
                            return BlocProvider.value(
                              value: context.read<InventoryBloc>(),
                              // آیتم فعلی را به فرم پاس می‌دهیم تا در حالت ویرایش باز شود
                              child: AddItemForm(editingItem: item),
                            );
                          },
                        );
                      },
                    ),
                    // دکمه حذف
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          _showDeleteConfirmationDialog(context, item),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('تعداد موجود: ${item.quantity} عدد'),
            const SizedBox(height: 4),
            Text('قیمت خرید: ${item.purchasePrice.toStringAsFixed(0)} تومان'),
            const SizedBox(height: 4),
            Text('قیمت فروش: ${item.salePrice.toStringAsFixed(0)} تومان'),
          ],
        ),
      ),
    );
  }

  // متد نمایش دیالوگ تایید برای حذف
  void _showDeleteConfirmationDialog(BuildContext context, InventoryItem item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تایید حذف'),
        content: Text('آیا از حذف کالای "${item.name}" مطمئن هستید؟'),
        actions: [
          TextButton(
            child: const Text('لغو'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
            onPressed: () {
              // ارسال ایونت حذف به BLoC
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

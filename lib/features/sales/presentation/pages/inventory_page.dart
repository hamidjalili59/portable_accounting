import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/add_item_form.dart';
import 'package:portable_accounting/features/inventory/presentation/widgets/inventory_list_item.dart';
// ...

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('موجودی انبار')),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              // برای شروع، ایونت لود را ارسال می‌کنیم
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
                  // استفاده از ویجت جدید
                  return InventoryListItem(item: items[index]);
                },
              );
            },
            error: (message) => Center(child: Text('خطا: $message')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // این کد فرم را از پایین صفحه نمایش می‌دهد
          showModalBottomSheet(
            context: context,
            // این اطمینان می‌دهد که شیت تمام صفحه نمی‌شود
            isScrollControlled: true,
            // برای گوشه‌های گرد
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) {
              // ما نیاز داریم Bloc را به فرم هم بدهیم، پس از BlocProvider.value استفاده می‌کنیم
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
  }
}

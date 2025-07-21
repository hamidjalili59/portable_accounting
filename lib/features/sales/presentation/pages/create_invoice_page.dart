import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/sales/domain/entities/sale_item.dart';
import 'package:portable_accounting/features/sales/presentation/bloc/sell_bloc.dart';

class CreateInvoicePage extends StatelessWidget {
  const CreateInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صدور فاکتور جدید')),
      // با BlocListener به استیت‌های یک‌بار مصرف مثل success و error گوش می‌دهیم
      body: BlocListener<SalesBloc, SalesState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('فاکتور با موفقیت ثبت شد!'),
                  backgroundColor: Colors.green,
                ),
              );
              // پس از موفقیت به صفحه قبل برمی‌گردیم
              context.pop();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        // با BlocBuilder رابط کاربری را بر اساس استیت می‌سازیم
        child: BlocBuilder<SalesBloc, SalesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text("در حال آماده سازی...")),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              success: () => const Center(
                child: Icon(Icons.check_circle, color: Colors.green, size: 50),
              ),
              // این وضعیت اصلی ماست که UI را نمایش می‌دهد
              loaded: (availableItems, invoiceItems, totalPrice) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // بخش اول: لیست کالاهای موجود در انبار
                    Expanded(
                      flex: 2,
                      child: _AvailableItemsList(items: availableItems),
                    ),
                    const VerticalDivider(),
                    // بخش دوم: فاکتور فعلی و سبد خرید
                    Expanded(
                      flex: 3,
                      child: _CurrentInvoice(
                        items: invoiceItems,
                        totalPrice: totalPrice,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// ویجت برای نمایش لیست کالاهای موجود در انبار
class _AvailableItemsList extends StatelessWidget {
  final List<InventoryItem> items;

  const _AvailableItemsList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "کالاهای انبار",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('موجودی: ${item.quantity}'),
                trailing: Text('${item.salePrice.toStringAsFixed(0)} تومان'),
                // با کلیک روی هر کالا، به فاکتور اضافه می‌شود
                onTap: item.quantity > 0
                    ? () => context.read<SalesBloc>().add(
                        SalesEvent.addItemToInvoice(item),
                      )
                    : null, // اگر موجودی صفر باشد، غیرفعال می‌شود
              );
            },
          ),
        ),
      ],
    );
  }
}

// ویجت برای نمایش و مدیریت فاکتور فعلی
class _CurrentInvoice extends StatelessWidget {
  final List<SaleItem> items;
  final double totalPrice;

  const _CurrentInvoice({required this.items, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final customerNameController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "فاکتور فروش",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
        Expanded(
          child: items.isEmpty
              ? const Center(child: Text('کالایی انتخاب نشده است.'))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                        '${item.quantity} عدد × ${item.price.toStringAsFixed(0)} تومان',
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
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: customerNameController,
                decoration: const InputDecoration(
                  labelText: 'نام مشتری (اختیاری)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "جمع کل:",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "${totalPrice.toStringAsFixed(0)} تومان",
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
                  onPressed: items.isNotEmpty
                      ? () => context.read<SalesBloc>().add(
                          SalesEvent.submitInvoice(
                            customerName: customerNameController.text,
                          ),
                        )
                      : null,
                  child: const Text('ثبت نهایی فاکتور'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/sales/domain/entities/sale_item.dart';
import 'package:portable_accounting/features/sales/presentation/bloc/sell_bloc.dart';

class CreateInvoicePage extends StatelessWidget {
  const CreateInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صدور فاکتور جدید')),
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
              context.pop();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        child: BlocBuilder<SalesBloc, SalesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text("در حال آماده سازی...")),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              success: () => const Center(
                child: Icon(Icons.check_circle, color: Colors.green, size: 50),
              ),
              loaded: (availableItems, invoiceItems, totalPrice) {
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
            );
          },
        ),
      ),
    );
  }
}

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
        // بخش اول: لیست کالاهای موجود در انبار
        Expanded(flex: 2, child: _AvailableItemsList(items: availableItems)),
        const VerticalDivider(),
        // بخش دوم: فاکتور فعلی و سبد خرید
        Expanded(
          flex: 3,
          child: _CurrentInvoice(items: invoiceItems, totalPrice: totalPrice),
        ),
      ],
    );
  }
}

// چیدمان موبایل
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
    // در موبایل، فقط سبد خرید را نمایش می‌دهیم و دکمه‌ای برای افزودن کالا داریم
    return Column(
      children: [
        Expanded(
          child: _CurrentInvoice(items: invoiceItems, totalPrice: totalPrice),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('افزودن کالا به فاکتور'),
            onPressed: () {
              // لیست کالاها را در یک BottomSheet نمایش می‌دهیم
              showModalBottomSheet(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<SalesBloc>(),
                  child: _AvailableItemsList(items: availableItems),
                ),
              );
            },
          ),
        ),
      ],
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

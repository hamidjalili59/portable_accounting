import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/get_all_inventory_items.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:portable_accounting/features/sales/domain/entities/sale_item.dart';
import 'package:portable_accounting/features/sales/domain/usecases/create_invoice.dart';

part 'sell_bloc.freezed.dart';

part 'sell_event.dart';

part 'sell_state.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final GetAllInventoryItems _getAllInventoryItems;
  final CreateInvoice _createInvoice;

  SalesBloc({
    required GetAllInventoryItems getAllInventoryItems,
    required CreateInvoice createInvoice,
  }) : _getAllInventoryItems = getAllInventoryItems,
       _createInvoice = createInvoice,
       super(const SalesState.initial()) {
    on<LoadInitialData>(_onLoadInitialData);
    on<AddItemToInvoice>(_onAddItemToInvoice);
    on<UpdateItemQuantity>(_onUpdateItemQuantity);
    on<RemoveItemFromInvoice>(_onRemoveItemFromInvoice);
    on<SubmitInvoice>(_onSubmitInvoice);
  }

  // متد برای محاسبه قیمت کل
  double _calculateTotalPrice(List<SaleItem> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Event Handlers

  Future<void> _onLoadInitialData(
    LoadInitialData event,
    Emitter<SalesState> emit,
  ) async {
    emit(const SalesState.loading());
    // در اینجا ما از استریم انبار استفاده می‌کنیم تا همیشه لیست کالاها به‌روز باشد
    // فعلا برای سادگی، یک بار اطلاعات را می‌خوانیم
    final result = await _getAllInventoryItems.repository.watchAllItems().first;
    result.fold(
      (failure) => emit(SalesState.error(failure.message)),
      (items) => emit(
        SalesState.loaded(
          availableItems: items,
          invoiceItems: [],
          totalPrice: 0,
        ),
      ),
    );
  }

  void _onAddItemToInvoice(AddItemToInvoice event, Emitter<SalesState> emit) {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      final newInvoiceItems = List<SaleItem>.from(currentState.invoiceItems);

      // چک می‌کنیم کالا قبلا اضافه شده یا نه
      final existingIndex = newInvoiceItems.indexWhere(
        (item) => item.inventoryItemId == event.item.id,
      );

      if (existingIndex != -1) {
        // اگر بود، تعدادش را یکی زیاد می‌کنیم
        final existingItem = newInvoiceItems[existingIndex];
        if (existingItem.quantity < event.item.quantity) {
          // چک کردن موجودی
          newInvoiceItems[existingIndex] = existingItem.copyWith(
            quantity: existingItem.quantity + 1,
          );
        }
      } else {
        // اگر نبود، به لیست اضافه می‌کنیم
        newInvoiceItems.add(
          SaleItem(
            id: 0,
            inventoryItemId: event.item.id,
            name: event.item.name,
            quantity: 1,
            price: event.item.salePrice,
          ),
        );
      }

      emit(
        currentState.copyWith(
          invoiceItems: newInvoiceItems,
          totalPrice: _calculateTotalPrice(newInvoiceItems),
        ),
      );
    }
  }

  void _onUpdateItemQuantity(
    UpdateItemQuantity event,
    Emitter<SalesState> emit,
  ) {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      final newInvoiceItems = List<SaleItem>.from(currentState.invoiceItems);
      final index = newInvoiceItems.indexWhere(
        (item) => item.id == event.item.id,
      );

      if (index != -1 && event.newQuantity > 0) {
        newInvoiceItems[index] = event.item.copyWith(
          quantity: event.newQuantity,
        );
        emit(
          currentState.copyWith(
            invoiceItems: newInvoiceItems,
            totalPrice: _calculateTotalPrice(newInvoiceItems),
          ),
        );
      }
    }
  }

  void _onRemoveItemFromInvoice(
    RemoveItemFromInvoice event,
    Emitter<SalesState> emit,
  ) {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      final newInvoiceItems = List<SaleItem>.from(currentState.invoiceItems)
        ..removeWhere((item) => item.id == event.item.id);

      emit(
        currentState.copyWith(
          invoiceItems: newInvoiceItems,
          totalPrice: _calculateTotalPrice(newInvoiceItems),
        ),
      );
    }
  }

  Future<void> _onSubmitInvoice(
    SubmitInvoice event,
    Emitter<SalesState> emit,
  ) async {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      if (currentState.invoiceItems.isEmpty) return;

      final newInvoice = Invoice(
        id: 0,
        date: DateTime.now(),
        items: currentState.invoiceItems,
        totalPrice: currentState.totalPrice,
        customerName: event.customerName,
      );

      final result = await _createInvoice(newInvoice);
      result.fold(
        (failure) => emit(SalesState.error(failure.message)),
        (_) => emit(const SalesState.success()),
      );
    }
  }
}

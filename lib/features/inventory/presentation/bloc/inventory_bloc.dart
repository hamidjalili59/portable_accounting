import 'dart:async' show StreamSubscription;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/add_inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/delete_inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/get_all_inventory_items.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/update_inventory_item.dart';

part 'inventory_bloc.freezed.dart';

part 'inventory_event.dart';

part 'inventory_state.dart';

enum InventorySortOrder { byNameAsc, byNameDesc, byQuantityAsc, byQuantityDesc }

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetAllInventoryItems getAllInventoryItems;
  final AddInventoryItem addInventoryItem;
  final UpdateInventoryItem updateInventoryItem;
  final DeleteInventoryItem deleteInventoryItem;

  StreamSubscription? _inventorySubscription;

  InventoryBloc({
    required this.getAllInventoryItems,
    required this.addInventoryItem,
    required this.updateInventoryItem,
    required this.deleteInventoryItem,
  }) : super(const InventoryState.initial()) {
    on<LoadInventory>(_onLoadInventory);
    on<AddItem>(_onAddItem);
    on<UpdateItem>(_onUpdateItem);
    on<DeleteItem>(_onDeleteItem);
    on<SearchChanged>(_onSearchChanged);
    on<SortOrderChanged>(_onSortOrderChanged);
  }

  List<InventoryItem> _applyFiltersAndSort(
    List<InventoryItem> items,
    String query,
    InventorySortOrder sortOrder,
  ) {
    // ۱. اعمال فیلتر جستجو
    final filteredItems = items.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // ۲. اعمال مرتب‌سازی
    filteredItems.sort((a, b) {
      switch (sortOrder) {
        case InventorySortOrder.byNameAsc:
          return a.name.compareTo(b.name);
        case InventorySortOrder.byNameDesc:
          return b.name.compareTo(a.name);
        case InventorySortOrder.byQuantityAsc:
          return a.quantity.compareTo(b.quantity);
        case InventorySortOrder.byQuantityDesc:
          return b.quantity.compareTo(a.quantity);
      }
    });

    return filteredItems;
  }

  void _onSearchChanged(SearchChanged event, Emitter<InventoryState> emit) {
    final currentState = state;
    if (currentState is Loaded) {
      final displayedItems = _applyFiltersAndSort(
        currentState.originalItems,
        event.query,
        currentState.sortOrder,
      );
      emit(
        currentState.copyWith(
          searchQuery: event.query,
          displayedItems: displayedItems,
        ),
      );
    }
  }

  void _onSortOrderChanged(
    SortOrderChanged event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state;
    if (currentState is Loaded) {
      final displayedItems = _applyFiltersAndSort(
        currentState.originalItems,
        currentState.searchQuery,
        event.sortOrder,
      );
      emit(
        currentState.copyWith(
          sortOrder: event.sortOrder,
          displayedItems: displayedItems,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _inventorySubscription?.cancel();
    return super.close();
  }

  Future<void> _onLoadInventory(
    LoadInventory event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const InventoryState.loading());
    // از این پس از onEach برای گوش دادن به استریم استفاده کنید
    await emit.onEach<Either<Failure, List<InventoryItem>>>(
      getAllInventoryItems.watch(NoParams()),
      onData: (eitherResult) {
        eitherResult.fold(
          (failure) => emit(InventoryState.error(failure.message)),
          (items) => emit(
            InventoryState.loaded(originalItems: items, displayedItems: items),
          ),
        );
      },
      onError: (error, stackTrace) =>
          emit(InventoryState.error(error.toString())),
    );
  }

  Future<void> _onAddItem(AddItem event, Emitter<InventoryState> emit) async {
    final result = await addInventoryItem(event.item);
    result.fold((failure) => emit(InventoryState.error(failure.message)), (_) {
      // هیچ کاری نمی‌کنیم! چون استریم watchAllItems به صورت خودکار
      // لیست جدید را ارسال می‌کند و باعث آپدیت شدن state می‌شود.
    });
  }

  Future<void> _onUpdateItem(
    UpdateItem event,
    Emitter<InventoryState> emit,
  ) async {
    final result = await updateInventoryItem(event.item);
    result.fold(
      (failure) => emit(InventoryState.error(failure.message)),
      (_) {}, // باز هم state به صورت خودکار آپدیت می‌شود
    );
  }

  Future<void> _onDeleteItem(
    DeleteItem event,
    Emitter<InventoryState> emit,
  ) async {
    final result = await deleteInventoryItem(event.id);
    result.fold(
      (failure) => emit(InventoryState.error(failure.message)),
      (_) {}, // باز هم state به صورت خودکار آپدیت می‌شود
    );
  }
}

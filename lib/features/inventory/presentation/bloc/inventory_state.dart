part of 'inventory_bloc.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;

  const factory InventoryState.loading() = _Loading;

  const factory InventoryState.loaded({
    required List<InventoryItem> originalItems, // لیست اصلی و دست‌نخورده
    required List<InventoryItem> displayedItems,
    // لیست فیلتر و مرتب شده برای نمایش
    @Default('') String searchQuery,
    @Default(InventorySortOrder.byNameAsc) InventorySortOrder sortOrder,
  }) = Loaded;

  const factory InventoryState.error(String message) = _Error;
}
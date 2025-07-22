part of 'sell_bloc.dart';

@freezed
class SalesState with _$SalesState {
  const factory SalesState.initial() = _Initial;

  const factory SalesState.loading() = _Loading;

  // وضعیت اصلی که UI با آن کار می‌کند
  const factory SalesState.loaded({
    required List<InventoryItem> availableItems, // تمام کالاهای موجود در انبار
    required List<SaleItem> invoiceItems,
    required double totalPrice,
  }) = _Loaded;

  const factory SalesState.success() = _Success;

  const factory SalesState.error(String message) = _Error;
}

part of 'sell_bloc.dart';

@freezed
class SalesEvent with _$SalesEvent {
  // برای خواندن لیست کالاها از انبار
  const factory SalesEvent.loadInitialData() = LoadInitialData;

  // برای افزودن یک کالا از انبار به فاکتور
  const factory SalesEvent.addItemToInvoice(InventoryItem item) = AddItemToInvoice;

  // برای تغییر تعداد یک کالا در فاکتور
  const factory SalesEvent.updateItemQuantity(SaleItem item, int newQuantity) = UpdateItemQuantity;

  // برای حذف یک کالا از فاکتور
  const factory SalesEvent.removeItemFromInvoice(SaleItem item) = RemoveItemFromInvoice;

  // برای ثبت نهایی فاکتور
  const factory SalesEvent.submitInvoice({String? customerName}) = SubmitInvoice;
}

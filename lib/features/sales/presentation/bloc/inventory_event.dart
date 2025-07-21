part of 'inventory_bloc.dart';

@freezed
class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.loadInventory() = LoadInventory;

  const factory InventoryEvent.addItem(InventoryItem item) = AddItem;

  const factory InventoryEvent.updateItem(InventoryItem item) = UpdateItem;

  const factory InventoryEvent.deleteItem(int id) = DeleteItem;
}

import 'package:drift/drift.dart';
import 'package:portable_accounting/core/database/app_database.dart';
import 'package:portable_accounting/features/inventory/data/datasources/local/inventory_table.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [InventoryItems])
class InventoryDao extends DatabaseAccessor<AppDatabase>
    with _$InventoryDaoMixin {
  InventoryDao(super.db);

  Stream<List<InventoryItemData>> watchAllItems() =>
      select(inventoryItems).watch();

  Future<void> insertItem(InventoryItemsCompanion item) =>
      into(inventoryItems).insert(item);

  Future<void> updateItem(InventoryItemsCompanion item) =>
      update(inventoryItems).replace(item);

  Future<void> deleteItem(int id) =>
      (delete(inventoryItems)..where((tbl) => tbl.id.equals(id))).go();
}

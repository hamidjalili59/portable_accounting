import 'package:drift/drift.dart';
import 'package:portable_accounting/core/database/app_database.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [InventoryItems])
class InventoryDao extends DatabaseAccessor<AppDatabase>
    with _$InventoryDaoMixin {
  // The constructor now directly gets the main AppDatabase instance.
  InventoryDao(super.db);

  Stream<List<InventoryItem>> watchAllItems() =>
      select(attachedDatabase.inventoryItems).watch();

  Future<void> insertItem(InventoryItemsCompanion item) =>
      into(attachedDatabase.inventoryItems).insert(item);

  Future<void> updateItem(InventoryItemsCompanion item) =>
      update(attachedDatabase.inventoryItems).replace(item);

  Future<void> deleteItem(int id) => (delete(
    attachedDatabase.inventoryItems,
  )..where((tbl) => tbl.id.equals(id))).go();
}

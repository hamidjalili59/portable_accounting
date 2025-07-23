import 'package:drift/drift.dart';

@DataClassName('InventoryItemData')
class InventoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get quantity => integer()();
  RealColumn get purchasePrice => real()();
  RealColumn get salePrice => real()();
  TextColumn get imagePath => text().nullable()();
}
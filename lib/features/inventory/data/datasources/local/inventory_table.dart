import 'package:drift/drift.dart';

@DataClassName('InventoryItemData')
class InventoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  RealColumn get quantity => real()();
  RealColumn get purchasePrice => real()();
  RealColumn get salePrice => real()();
  TextColumn get imagePath => text().nullable()();
}
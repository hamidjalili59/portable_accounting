import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/database/app_database.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/features/inventory/data/datasources/local/inventory_dao.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryDao inventoryDao;

  InventoryRepositoryImpl({required this.inventoryDao});

  @override
  Stream<Either<Failure, List<InventoryItem>>> watchAllItems() {
    try {
      return inventoryDao.watchAllItems().map((itemsData) {
        final items = itemsData
            .map((itemData) => _mapDataToEntity(itemData))
            .toList();
        return Right(items);
      });
    } catch (e) {
      return Stream.value(
        const Left(DatabaseFailure(message: 'Failed to watch items.')),
      );
    }
  }

  // ... پیاده‌سازی addItem, updateItem, deleteItem

  // Helper function to map from Data layer object to Domain entity
  InventoryItem _mapDataToEntity(InventoryItemData data) {
    return InventoryItem(
      id: data.id,
      name: data.name,
      quantity: data.quantity,
      purchasePrice: data.purchasePrice,
      salePrice: data.salePrice,
      imagePath: data.imagePath,
    );
  }

  // Helper function to map from Domain entity to Data layer object
  InventoryItemsCompanion _mapEntityToCompanion(InventoryItem entity) {
    return InventoryItemsCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      // id=0 یعنی آیتم جدید است
      name: Value(entity.name),
      quantity: Value(entity.quantity),
      purchasePrice: Value(entity.purchasePrice),
      salePrice: Value(entity.salePrice),
      imagePath: Value(entity.imagePath),
    );
  }

  @override
  Future<Either<Failure, void>> addItem(InventoryItem item) async {
    try {
      await inventoryDao.insertItem(
        _mapEntityToCompanion(item.copyWith(id: 0)),
      );
      return const Right(null);
    } catch (e) {
      return const Left(DatabaseFailure(message: 'Failed to add item.'));
    }
  }

  @override
  Future<Either<Failure, void>> updateItem(InventoryItem item) async {
    try {
      final companion = _mapEntityToCompanion(item);
      await inventoryDao.updateItem(companion);
      return const Right(null);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Failed to update item: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteItem(int id) async {
    try {
      await inventoryDao.deleteItem(id);
      return const Right(null);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Failed to delete item: ${e.toString()}'),
      );
    }
  }
}

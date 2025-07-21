import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/repositories/inventory_repository.dart';

class UpdateInventoryItem extends UseCase<void, InventoryItem> {
  final InventoryRepository repository;

  UpdateInventoryItem(this.repository);

  @override
  Future<Either<Failure, void>> call(InventoryItem params) async {
    return await repository.updateItem(params);
  }
}
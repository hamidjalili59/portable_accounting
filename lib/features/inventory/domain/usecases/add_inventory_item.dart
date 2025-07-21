import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/repositories/inventory_repository.dart';

class AddInventoryItem extends UseCase<void, InventoryItem> {
  final InventoryRepository repository;

  AddInventoryItem(this.repository);

  @override
  Future<Either<Failure, void>> call(InventoryItem params) async {
    return await repository.addItem(params);
  }
}
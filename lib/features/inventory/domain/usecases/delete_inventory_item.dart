import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/inventory/domain/repositories/inventory_repository.dart';

class DeleteInventoryItem extends UseCase<void, int> {
  final InventoryRepository repository;

  DeleteInventoryItem(this.repository);

  @override
  Future<Either<Failure, void>> call(int params) async {
    return await repository.deleteItem(params);
  }
}

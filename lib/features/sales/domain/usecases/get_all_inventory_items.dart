
import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/repositories/inventory_repository.dart';

class GetAllInventoryItems extends UseCase<List<InventoryItem>, NoParams> {
  final InventoryRepository repository;

  GetAllInventoryItems(this.repository);

  // چون استریم است، یک متد جدا برای آن می‌نویسیم
  Stream<Either<Failure, List<InventoryItem>>> watch(NoParams params) {
    return repository.watchAllItems();
  }

  // متد call را اینجا پیاده‌سازی نمی‌کنیم چون این usecase استریمی است
  @override
  Future<Either<Failure, List<InventoryItem>>> call(NoParams params) {
    throw UnimplementedError();
  }
}
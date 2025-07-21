import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
abstract class InventoryRepository {
  // تماشای تمام آیتم‌ها به صورت استریم برای آپدیت لحظه‌ای
  Stream<Either<Failure, List<InventoryItem>>> watchAllItems();

  // اضافه کردن یک آیتم جدید
  Future<Either<Failure, void>> addItem(InventoryItem item);

  // آپدیت کردن یک آیتم
  Future<Either<Failure, void>> updateItem(InventoryItem item);

  // حذف یک آیتم
  Future<Either<Failure, void>> deleteItem(int id);
}
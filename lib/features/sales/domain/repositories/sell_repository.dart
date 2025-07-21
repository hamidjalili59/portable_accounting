import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';

import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';

abstract class SalesRepository {
  // یک فاکتور جدید ایجاد می‌کند
  // این مهم‌ترین متد ماست. باید هم فاکتور را ذخیره کند و هم موجودی انبار را کم کند.
  Future<Either<Failure, void>> createInvoice(Invoice invoice);

  // تمام فاکتورهای ذخیره شده را برمی‌گرداند
  Future<Either<Failure, List<Invoice>>> getAllInvoices();
}

import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';

import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';

abstract class SalesRepository {
  Future<Either<Failure, void>> createInvoice(Invoice invoice);

  Future<Either<Failure, List<Invoice>>> getAllInvoices();

  Future<Either<Failure, List<Invoice>>> getInvoicesByDateRange(
    DateTime start,
    DateTime end,
  );

  Future<Either<Failure, List<Invoice>>> getInvoicesByDateRangeAndQuery({
    required DateTime start,
    required DateTime end,
    String? query,
  });
}

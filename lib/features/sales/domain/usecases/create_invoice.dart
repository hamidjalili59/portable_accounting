import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:portable_accounting/features/sales/domain/repositories/sell_repository.dart';

class CreateInvoice extends UseCase<void, Invoice> {
  final SalesRepository repository;

  CreateInvoice(this.repository);

  @override
  Future<Either<Failure, void>> call(Invoice params) async {
    return await repository.createInvoice(params);
  }
}
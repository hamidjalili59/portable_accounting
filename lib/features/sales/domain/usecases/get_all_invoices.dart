import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:portable_accounting/features/sales/domain/repositories/sell_repository.dart';

class GetAllInvoices extends UseCase<List<Invoice>, NoParams> {
  final SalesRepository repository;

  GetAllInvoices(this.repository);

  @override
  Future<Either<Failure, List<Invoice>>> call(NoParams params) async {
    return await repository.getAllInvoices();
  }
}

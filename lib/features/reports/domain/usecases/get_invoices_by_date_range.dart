import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:portable_accounting/features/sales/domain/repositories/sell_repository.dart';

class GetInvoicesByDateRange extends UseCase<List<Invoice>, DateRangeParams> {
  final SalesRepository salesRepository;

  GetInvoicesByDateRange(this.salesRepository);

  @override
  Future<Either<Failure, List<Invoice>>> call(DateRangeParams params) async {
    return await salesRepository.getInvoicesByDateRange(
      params.start,
      params.end,
    );
  }
}

class DateRangeParams extends Equatable {
  final DateTime start;
  final DateTime end;

  const DateRangeParams({required this.start, required this.end});

  @override
  List<Object> get props => [start, end];
}

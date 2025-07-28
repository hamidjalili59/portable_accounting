import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:portable_accounting/features/sales/domain/repositories/sell_repository.dart';
class GetFilteredInvoices extends UseCase<List<Invoice>, FilterParams> {
  final SalesRepository repository;

  GetFilteredInvoices(this.repository);

  @override
  Future<Either<Failure, List<Invoice>>> call(FilterParams params) async {
    // Note: You need to implement getInvoicesByDateRangeAndQuery in your repository
    return await repository.getInvoicesByDateRangeAndQuery(
      start: params.startDate,
      end: params.endDate,
      query: params.searchQuery,
    );
  }
}

class FilterParams extends Equatable {
  final DateTime startDate;
  final DateTime endDate;
  final String? searchQuery;

  const FilterParams({
    required this.startDate,
    required this.endDate,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [startDate, endDate, searchQuery];
}

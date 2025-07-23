import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import '../../domain/usecases/get_invoices_by_date_range.dart';

part 'reports_bloc.freezed.dart';

// --- Event ---
@freezed
class ReportsEvent with _$ReportsEvent {
  const factory ReportsEvent.generateReport({
    required DateTime start,
    required DateTime end,
  }) = _GenerateReport;

  @override
  DateTime get end => DateTime.now();

  @override
  DateTime get start => DateTime.now().subtract(const Duration(days: 30));
}

// --- State ---
@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = _Initial;

  const factory ReportsState.loading() = _Loading;

  const factory ReportsState.loaded(List<Invoice> invoices) = _Loaded;

  const factory ReportsState.error(String message) = _Error;
}

// --- BLoC ---
class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final GetInvoicesByDateRange _getInvoicesByDateRange;

  ReportsBloc({required GetInvoicesByDateRange getInvoicesByDateRange})
    : _getInvoicesByDateRange = getInvoicesByDateRange,
      super(const ReportsState.initial()) {
    on<_GenerateReport>((event, emit) async {
      emit(const ReportsState.loading());
      final result = await _getInvoicesByDateRange(
        DateRangeParams(start: event.start, end: event.end),
      );
      result.fold(
        (failure) => emit(ReportsState.error(failure.message)),
        (invoices) => emit(ReportsState.loaded(invoices)),
      );
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/get_filtered_invoices.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';

part 'invoice_list_bloc.freezed.dart';

// --- Event ---
@freezed
class InvoiceListEvent with _$InvoiceListEvent {
  const factory InvoiceListEvent.load({
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
  }) = _Load;

  @override
  DateTime? get endDate => null;

  @override
  String? get searchQuery => null;

  @override
  DateTime? get startDate => null;
}

// --- State ---
@freezed
class InvoiceListState with _$InvoiceListState {
  const factory InvoiceListState.initial() = _Initial;

  const factory InvoiceListState.loading() = _Loading;

  const factory InvoiceListState.loaded({
    required List<Invoice> invoices,
    required DateTime startDate,
    required DateTime endDate,
    required String searchQuery,
  }) = Loaded;

  const factory InvoiceListState.error(String message) = _Error;
}

// --- BLoC ---
class InvoiceListBloc extends Bloc<InvoiceListEvent, InvoiceListState> {
  final GetFilteredInvoices _getFilteredInvoices;

  InvoiceListBloc({
    required GetFilteredInvoices getFilteredInvoices,
  }) : _getFilteredInvoices = getFilteredInvoices,
       super(const InvoiceListState.initial()) {
    on<_Load>((event, emit) async {
      emit(const InvoiceListState.loading());

      final end = event.endDate ?? DateTime.now();
      final start = event.startDate ?? end.subtract(const Duration(days: 5000));
      final query = event.searchQuery ?? '';

      // Call the UseCase with the filter parameters
      final result = await _getFilteredInvoices(
        FilterParams(startDate: start, endDate: end, searchQuery: query),
      );

      result.fold(
        (failure) => emit(InvoiceListState.error(failure.message)),
        (invoices) => emit(
          InvoiceListState.loaded(
            invoices: invoices,
            startDate: start,
            endDate: end,
            searchQuery: query,
          ),
        ),
      );
    });
  }
}

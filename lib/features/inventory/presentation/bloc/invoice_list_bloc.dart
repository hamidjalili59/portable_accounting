import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:portable_accounting/features/sales/domain/usecases/get_all_invoices.dart';

part 'invoice_list_bloc.freezed.dart';

// --- Event ---
@freezed
class InvoiceListEvent with _$InvoiceListEvent {
  const factory InvoiceListEvent.load() = _Load;
}

// --- State ---
@freezed
class InvoiceListState with _$InvoiceListState {
  const factory InvoiceListState.initial() = _Initial;

  const factory InvoiceListState.loading() = _Loading;

  const factory InvoiceListState.loaded(List<Invoice> invoices) = _Loaded;

  const factory InvoiceListState.error(String message) = _Error;
}

// --- BLoC ---
class InvoiceListBloc extends Bloc<InvoiceListEvent, InvoiceListState> {
  final GetAllInvoices _getAllInvoices;

  InvoiceListBloc({required GetAllInvoices getAllInvoices})
    : _getAllInvoices = getAllInvoices,
      super(const InvoiceListState.initial()) {
    on<_Load>((event, emit) async {
      emit(const InvoiceListState.loading());
      final result = await _getAllInvoices(NoParams());
      result.fold(
        (failure) => emit(InvoiceListState.error(failure.message)),
        (invoices) => emit(InvoiceListState.loaded(invoices)),
      );
    });
  }
}

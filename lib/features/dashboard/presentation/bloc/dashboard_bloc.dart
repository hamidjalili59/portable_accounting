import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:portable_accounting/features/dashboard/domain/usecases/get_dashboard_data.dart';

part 'dashboard_bloc.freezed.dart';

// --- Event ---
@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.load() = _Load;
}

// --- State ---
@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded(DashboardData data) = _Loaded;
  const factory DashboardState.error(String message) = _Error;
}

// --- BLoC ---
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardData _getDashboardData;

  DashboardBloc({required GetDashboardData getDashboardData})
      : _getDashboardData = getDashboardData,
        super(const DashboardState.initial()) {
    on<_Load>((event, emit) async {
      emit(const DashboardState.loading());
      final result = await _getDashboardData(NoParams());
      result.fold(
            (failure) => emit(DashboardState.error(failure.message)),
            (data) => emit(DashboardState.loaded(data)),
      );
    });
  }
}
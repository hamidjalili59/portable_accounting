import 'package:fpdart/fpdart.dart';
import 'package:portable_accounting/core/error/failure.dart';
import 'package:portable_accounting/core/usecase/usecase.dart';
import 'package:portable_accounting/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:portable_accounting/features/dashboard/domain/repository/dashboard_repository.dart';

class GetDashboardData extends UseCase<DashboardData, NoParams> {
  final DashboardRepository repository;

  GetDashboardData(this.repository);

  @override
  Future<Either<Failure, DashboardData>> call(NoParams params) async {
    return await repository.getDashboardData();
  }
}

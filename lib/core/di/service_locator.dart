import 'package:get_it/get_it.dart';
import 'package:portable_accounting/core/database/app_database.dart';
import 'package:portable_accounting/features/dashboard/data/repositories/dashboard_repostory_impl.dart';
import 'package:portable_accounting/features/dashboard/domain/usecases/get_dashboard_data.dart';
import 'package:portable_accounting/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:portable_accounting/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:portable_accounting/features/inventory/data/datasources/local/inventory_dao.dart';
import 'package:portable_accounting/features/inventory/data/repositories/inventory_repository_impl.dart';
import 'package:portable_accounting/features/inventory/domain/repositories/inventory_repository.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/add_inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/delete_inventory_item.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/get_all_inventory_items.dart';
import 'package:portable_accounting/features/inventory/domain/usecases/update_inventory_item.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/invoice_list_bloc.dart';
import 'package:portable_accounting/features/sales/data/datasources/local/sales_dao.dart';
import 'package:portable_accounting/features/sales/data/repositories/sell_repository_impl.dart';
import 'package:portable_accounting/features/sales/domain/repositories/sell_repository.dart';
import 'package:portable_accounting/features/sales/domain/usecases/create_invoice.dart';
import 'package:portable_accounting/features/sales/domain/usecases/get_all_invoices.dart';
import 'package:portable_accounting/features/sales/presentation/bloc/sell_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // -------- Inventory Feature
  // -- Data Source
  sl.registerLazySingleton<InventoryDao>(() => InventoryDao(sl()));

  // -- Repository
  sl.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(inventoryDao: sl()),
  );

  // -- Use Cases
  sl.registerLazySingleton(() => GetAllInventoryItems(sl()));
  sl.registerLazySingleton(() => AddInventoryItem(sl()));
  sl.registerLazySingleton(() => DeleteInventoryItem(sl()));
  sl.registerLazySingleton(() => UpdateInventoryItem(sl()));

  // -- Bloc
  sl.registerFactory(
    () => InventoryBloc(
      getAllInventoryItems: sl(),
      addInventoryItem: sl(),
      deleteInventoryItem: sl(),
      updateInventoryItem: sl(),
    ),
  );

  // -------- Sales Feature
  // Data Source
  sl.registerLazySingleton<SalesDao>(() => SalesDao(sl()));

  // Repository
  sl.registerLazySingleton<SalesRepository>(
    () => SalesRepositoryImpl(db: sl(), salesDao: sl(), inventoryDao: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => CreateInvoice(sl()));
  sl.registerLazySingleton(() => GetAllInvoices(sl()));
  // Bloc
  sl.registerFactory(
    () => SalesBloc(getAllInventoryItems: sl(), createInvoice: sl()),
  );
  sl.registerFactory(() => InvoiceListBloc(getAllInvoices: sl()));

  // -- Dashboard Feature --
  // Repository
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(db: sl()),
  );
  // Use Case
  sl.registerLazySingleton(() => GetDashboardData(sl()));

  sl.registerFactory(() => DashboardBloc(getDashboardData: sl()));
}

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:portable_accounting/features/inventory/data/datasources/local/inventory_dao.dart';
import 'package:portable_accounting/features/inventory/data/datasources/local/inventory_table.dart';
import 'package:portable_accounting/features/sales/data/datasources/local/sales_dao.dart';
import 'package:portable_accounting/features/sales/data/datasources/local/sell_table.dart';

part 'app_database.g.dart';

const String dbName = 'app_database.db';

@DriftDatabase(
  tables: [InventoryItems, Invoices, SaleItems],
  daos: [InventoryDao, SalesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: dbName,
      native: const DriftNativeOptions(),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
    );
  }
}

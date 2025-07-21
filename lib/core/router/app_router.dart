import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/di/service_locator.dart';
import 'package:portable_accounting/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:portable_accounting/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/invoice_list_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/pages/inventory_page.dart';
import 'package:portable_accounting/features/inventory/presentation/pages/invoices_list_page.dart';
import 'package:portable_accounting/features/sales/presentation/bloc/sell_bloc.dart';
import 'package:portable_accounting/features/sales/presentation/pages/create_invoice_page.dart';
import 'package:portable_accounting/features/settings/presentation/pages/settings_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/inventory',
  routes: [
    GoRoute(path: '/', builder: (context, state) => Placeholder()),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => BlocProvider(
        create: (context) => sl<InventoryBloc>(),
        child: const InventoryPage(),
      ),
    ),

    GoRoute(
      path: '/create-invoice',
      builder: (context, state) => BlocProvider(
        create: (context) =>
            sl<SalesBloc>()..add(const SalesEvent.loadInitialData()),
        child: const CreateInvoicePage(),
      ),
    ),
    GoRoute(
      path: '/invoices',
      builder: (context, state) => BlocProvider(
        create: (context) =>
            sl<InvoiceListBloc>()..add(const InvoiceListEvent.load()),
        child: const InvoicesListPage(),
      ),
    ),

    GoRoute(
      path: '/dashboard',
      builder: (context, state) => BlocProvider(
        create: (context) =>
            sl<DashboardBloc>()..add(const DashboardEvent.load()),
        child: const DashboardPage(),
      ),
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);

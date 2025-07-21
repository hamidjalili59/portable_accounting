// ...

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/di/service_locator.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:portable_accounting/features/inventory/presentation/pages/inventory_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/inventory',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Placeholder(),
    ),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => BlocProvider(
        create: (context) => sl<InventoryBloc>(),
        child: const InventoryPage(),
      ),
    ),
  ],
  // ...
);
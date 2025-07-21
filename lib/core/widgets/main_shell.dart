import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portable_accounting/core/widgets/responsive_layout.dart';

class MainShell extends StatefulWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/dashboard')) {
      return 1;
    }
    if (location.startsWith('/invoices')) {
      return 2;
    }
    if (location.startsWith('/settings')) {
      return 3;
    }
    // صفحه پیش‌فرض انبار است
    return 0;
  }

  void _onDestinationSelected(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/inventory');
        break;
      case 1:
        context.go('/dashboard');
        break;
      case 2:
        context.go('/invoices');
        break;
      case 3:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // در موبایل، فقط محتوا را نمایش می‌دهیم
      mobileBody: widget.child,
      // در دسکتاپ، یک Scaffold با منوی کناری داریم
      desktopBody: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _calculateSelectedIndex(context),
              onDestinationSelected: (index) => _onDestinationSelected(index, context),
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.inventory_2_outlined),
                  selectedIcon: Icon(Icons.inventory_2),
                  label: Text('انبار'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
                  label: Text('داشبورد'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  selectedIcon: Icon(Icons.receipt_long),
                  label: Text('فاکتورها'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('تنظیمات'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // محتوای اصلی صفحه در اینجا قرار می‌گیرد
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
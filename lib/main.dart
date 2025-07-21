import 'package:flutter/material.dart';
import 'package:portable_accounting/core/di/service_locator.dart' as di;
import 'package:portable_accounting/core/router/app_router.dart';
import 'package:portable_accounting/core/theme/app_colors.dart';
import 'package:portable_accounting/core/theme/app_text_styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'نرم افزار حسابداری',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          error: AppColors.error,
          background: AppColors.background,
          surface: AppColors.surface,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: AppColors.onBackground,
          onSurface: AppColors.onSurface,
          onError: Colors.white,
        ),
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.headline1,
          displayMedium: AppTextStyles.headline2,
          bodyLarge: AppTextStyles.bodyText1,
          bodyMedium: AppTextStyles.bodyText2,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

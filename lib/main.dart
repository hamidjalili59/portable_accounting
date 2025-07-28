import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portable_accounting/core/di/service_locator.dart' as di;
import 'package:portable_accounting/core/l10n/app_localizations.dart';
import 'package:portable_accounting/core/router/app_router.dart';
import 'package:portable_accounting/core/services/locale_cubit.dart';
import 'package:portable_accounting/core/theme/app_colors.dart';
import 'package:portable_accounting/core/theme/app_text_styles.dart';

import 'core/di/service_locator.dart';
import 'core/services/currency_service.dart';
import 'core/services/settings_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CurrencyCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(create: (context) => sl<SettingsCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        // final l10n = context.l10n;
        return MaterialApp.router(
          title: 'accounting',
          debugShowCheckedModeBanner: false,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
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
      },
    );
  }
}

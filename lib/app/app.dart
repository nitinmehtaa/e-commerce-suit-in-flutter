import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/app/app_router.dart';
import 'package:flutter_app_tablayout/config/app_config.dart';
import 'package:flutter_app_tablayout/design_system/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: AppTheme.buildTheme(
            config: config,
            brightness: Brightness.light,
            dynamicScheme: lightDynamic,
          ),
          darkTheme: AppTheme.buildTheme(
            config: config,
            brightness: Brightness.dark,
            dynamicScheme: darkDynamic,
          ),
          themeMode: config.themeMode,
        );
      },
    );
  }
}

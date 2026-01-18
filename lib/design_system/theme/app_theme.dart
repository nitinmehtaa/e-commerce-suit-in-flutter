import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/config/app_config.dart';
import 'package:flutter_app_tablayout/design_system/theme/app_theme_extension.dart';

class AppTheme {
  static ThemeData buildTheme({
    required AppConfig config,
    required Brightness brightness,
    ColorScheme? dynamicScheme,
  }) {
    final seedColor = config.preset == AppBrandPreset.quickCommerce
        ? const Color(0xFFE53935)
        : const Color(0xFF1C1B1F);

    final colorScheme = (dynamicScheme ??
            ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness))
        .harmonized();

    final extension = AppThemeExtension(
      brandPrimary: config.preset == AppBrandPreset.quickCommerce
          ? const Color(0xFFE53935)
          : const Color(0xFF111111),
      brandOnPrimary: Colors.white,
      searchBackground: brightness == Brightness.dark
          ? const Color(0xFF1F1F1F)
          : Colors.white,
      searchForeground:
          brightness == Brightness.dark ? Colors.white70 : Colors.black54,
      sectionBackground: brightness == Brightness.dark
          ? const Color(0xFF111111)
          : const Color(0xFFF7F7F7),
      promoHighlight: config.preset == AppBrandPreset.quickCommerce
          ? const Color(0xFF2E7D32)
          : const Color(0xFFB08D57),
      promoText: brightness == Brightness.dark ? Colors.white : Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: extension.brandPrimary,
        foregroundColor: extension.brandOnPrimary,
        elevation: 0,
      ),
      scaffoldBackgroundColor:
          brightness == Brightness.dark ? const Color(0xFF0B0B0B) : Colors.white,
      extensions: <ThemeExtension<dynamic>>[
        extension,
      ],
    );
  }
}

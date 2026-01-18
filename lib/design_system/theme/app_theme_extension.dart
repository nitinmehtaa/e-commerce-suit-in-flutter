import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.brandPrimary,
    required this.brandOnPrimary,
    required this.searchBackground,
    required this.searchForeground,
    required this.sectionBackground,
    required this.promoHighlight,
    required this.promoText,
  });

  final Color brandPrimary;
  final Color brandOnPrimary;
  final Color searchBackground;
  final Color searchForeground;
  final Color sectionBackground;
  final Color promoHighlight;
  final Color promoText;

  @override
  AppThemeExtension copyWith({
    Color? brandPrimary,
    Color? brandOnPrimary,
    Color? searchBackground,
    Color? searchForeground,
    Color? sectionBackground,
    Color? promoHighlight,
    Color? promoText,
  }) {
    return AppThemeExtension(
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandOnPrimary: brandOnPrimary ?? this.brandOnPrimary,
      searchBackground: searchBackground ?? this.searchBackground,
      searchForeground: searchForeground ?? this.searchForeground,
      sectionBackground: sectionBackground ?? this.sectionBackground,
      promoHighlight: promoHighlight ?? this.promoHighlight,
      promoText: promoText ?? this.promoText,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t) ??
          brandPrimary,
      brandOnPrimary: Color.lerp(brandOnPrimary, other.brandOnPrimary, t) ??
          brandOnPrimary,
      searchBackground:
          Color.lerp(searchBackground, other.searchBackground, t) ??
              searchBackground,
      searchForeground:
          Color.lerp(searchForeground, other.searchForeground, t) ??
              searchForeground,
      sectionBackground:
          Color.lerp(sectionBackground, other.sectionBackground, t) ??
              sectionBackground,
      promoHighlight:
          Color.lerp(promoHighlight, other.promoHighlight, t) ?? promoHighlight,
      promoText: Color.lerp(promoText, other.promoText, t) ?? promoText,
    );
  }
}

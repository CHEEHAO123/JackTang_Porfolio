import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final background = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final surface = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textMuted = isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: AppColors.accent,
      onPrimary: Colors.white,
      secondary: AppColors.accentLight,
      onSecondary: Colors.white,
      error: const Color(0xFFE5484D),
      onError: Colors.white,
      surface: surface,
      onSurface: textPrimary,
      outline: border,
    );

    final baseTextTheme = GoogleFonts.interTextTheme(
      isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
    );

    final headingFont = baseTextTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      canvasColor: background,
      splashFactory: InkRipple.splashFactory,
      textTheme: baseTextTheme.copyWith(
        displayLarge: headingFont.displayLarge?.copyWith(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 48),
        displayMedium: headingFont.displayMedium?.copyWith(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 38),
        displaySmall: headingFont.displaySmall?.copyWith(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 30),
        headlineLarge: headingFont.headlineLarge?.copyWith(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 28),
        headlineMedium: headingFont.headlineMedium?.copyWith(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 24),
        headlineSmall: headingFont.headlineSmall?.copyWith(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 18),
        titleLarge: headingFont.titleLarge?.copyWith(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 19),
        titleMedium: baseTextTheme.titleMedium?.copyWith(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 15),
        titleSmall: baseTextTheme.titleSmall?.copyWith(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 13),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: textPrimary, height: 1.6, fontSize: 15),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: textMuted, height: 1.6, fontSize: 13),
        bodySmall: baseTextTheme.bodySmall?.copyWith(color: textMuted, height: 1.5, fontSize: 11.5),
        labelLarge: baseTextTheme.labelLarge?.copyWith(color: textPrimary, fontSize: 12),
      ),
      dividerColor: border,
      extensions: [
        PortfolioSurfaces(
          background: background,
          surface: surface,
          surfaceAlt: isDark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt,
          border: border,
          textPrimary: textPrimary,
          textMuted: textMuted,
        ),
      ],
    );
  }
}

/// Extra surface tokens not covered by [ColorScheme], exposed via
/// `Theme.of(context).extension<PortfolioSurfaces>()`.
class PortfolioSurfaces extends ThemeExtension<PortfolioSurfaces> {
  final Color background;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color textPrimary;
  final Color textMuted;

  const PortfolioSurfaces({
    required this.background,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.textPrimary,
    required this.textMuted,
  });

  @override
  PortfolioSurfaces copyWith({
    Color? background,
    Color? surface,
    Color? surfaceAlt,
    Color? border,
    Color? textPrimary,
    Color? textMuted,
  }) {
    return PortfolioSurfaces(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
    );
  }

  @override
  ThemeExtension<PortfolioSurfaces> lerp(ThemeExtension<PortfolioSurfaces>? other, double t) {
    if (other is! PortfolioSurfaces) return this;
    return PortfolioSurfaces(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
    );
  }
}

extension PortfolioSurfacesX on BuildContext {
  PortfolioSurfaces get surfaces => Theme.of(this).extension<PortfolioSurfaces>()!;
}

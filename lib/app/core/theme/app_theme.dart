import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../design/tokens/app_colors.dart';
import '../../../design/tokens/app_radius.dart';

class AppTheme {
  static ThemeData dark() => _buildTheme(Brightness.dark);
  static ThemeData light() => _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final base = isDark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);

    final bgMid = isDark ? AppColors.bgMidDark : AppColors.bgMidLight;
    final surface = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final surface2 = isDark ? AppColors.surface2Dark : AppColors.surface2Light;
    final stroke = isDark ? AppColors.strokeDark : AppColors.strokeLight;

    final textPrimary = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final textSecondary = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    final textMuted = isDark
        ? AppColors.textMutedDark
        : AppColors.textMutedLight;

    final baseText = GoogleFonts.interTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: bgMid,
      colorScheme: base.colorScheme.copyWith(
        brightness: brightness,
        primary: AppColors.primary,
        surface: surface,
      ),

      textTheme: baseText.copyWith(
        headlineLarge: (baseText.headlineLarge ?? const TextStyle()).copyWith(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          height: 1.05,
        ),
        titleLarge: (baseText.titleLarge ?? const TextStyle()).copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        titleMedium: (baseText.titleMedium ?? const TextStyle()).copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: (baseText.bodyLarge ?? const TextStyle()).copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textSecondary,
          height: 1.35,
        ),
        bodyMedium: (baseText.bodyMedium ?? const TextStyle()).copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textSecondary,
          height: 1.35,
        ),
        labelLarge: (baseText.labelLarge ?? const TextStyle()).copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: textMuted,
          letterSpacing: 0.8,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface2,
        hintStyle: TextStyle(color: textMuted),
        labelStyle: TextStyle(color: textMuted),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: BorderSide(color: stroke, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
        ),
      ),
    );
  }
}

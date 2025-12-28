import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';

class AppTheme {
  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    final baseText = GoogleFonts.interTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bgMid,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),

      textTheme: baseText.copyWith(
        headlineLarge: (baseText.headlineLarge ?? const TextStyle()).copyWith(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
          height: 1.05,
        ),
        titleLarge: (baseText.titleLarge ?? const TextStyle()).copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        titleMedium: (baseText.titleMedium ?? const TextStyle()).copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyLarge: (baseText.bodyLarge ?? const TextStyle()).copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
          height: 1.35,
        ),
        bodyMedium: (baseText.bodyMedium ?? const TextStyle()).copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
          height: 1.35,
        ),
        labelLarge: (baseText.labelLarge ?? const TextStyle()).copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: AppColors.textMuted,
          letterSpacing: 0.8,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface2,
        hintStyle: const TextStyle(color: AppColors.textMuted),
        labelStyle: const TextStyle(color: AppColors.textMuted),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: const BorderSide(color: AppColors.stroke, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppColors {
  // Dark Base
  static const bgTopDark = Color(0xFF070B14);
  static const bgMidDark = Color(0xFF0B1323);
  static const bgBottomDark = Color(0xFF09101E);

  // Light Base
  static const bgTopLight = Color(0xFFF8FAFF);
  static const bgMidLight = Color(0xFFF0F4FF);
  static const bgBottomLight = Color(0xFFECF1FF);

  // Surfaces (Dark)
  static const surfaceDark = Color(0xFF141C2B);
  static const surface2Dark = Color(0xFF101827);
  static const strokeDark = Color(0xFF273247);

  // Surfaces (Light)
  static const surfaceLight = Color(0xFFFFFFFF);
  static const surface2Light = Color(0xFFF5F8FF);
  static const strokeLight = Color(0xFFD0D9E7);

  // Text (Dark)
  static const textPrimaryDark = Color(0xFFEFF4FF);
  static const textSecondaryDark = Color(0xFF9BAAC2);
  static const textMutedDark = Color(0xFF6C7B93);

  // Text (Light)
  static const textPrimaryLight = Color(0xFF1A1F2B);
  static const textSecondaryLight = Color(0xFF4A5568);
  static const textMutedLight = Color(0xFF718096);

  // Accent (Same for both usually, or slightly adjusted)
  static const primary = Color(0xFF1D5CFF);
  static const primarySoft = Color(0xFF2A6BFF);

  // Status
  static const danger = Color(0xFFFF4D4D);

  // Alpha-blended Colors (Optimized)
  static const primaryAlpha25 = Color(0x401D5CFF); // 0.25 alpha
  static const primaryAlpha22 = Color(0x381D5CFF); // 0.22 alpha
  static const whiteAlpha14 = Color(0x24FFFFFF); // 0.14 alpha
  static const whiteAlpha80 = Color(0xCCFFFFFF); // 0.80 alpha
  static const surfaceAlpha75 = Color(0xBF141C2B); // 0.75 alpha (Dark)
  static const surface2Alpha90 = Color(0xE6101827); // 0.90 alpha (Dark)
  static const surface2Alpha95 = Color(0xF2101827); // 0.95 alpha (Dark)

  // Legacy/Helper getters to avoid breaking changes if any
  static const bgMid = bgMidDark;
  static const surface = surfaceDark;
  static const surface2 = surface2Dark;
  static const stroke = strokeDark;
  static const textPrimary = textPrimaryDark;
  static const textSecondary = textSecondaryDark;
  static const textMuted = textMutedDark;
}

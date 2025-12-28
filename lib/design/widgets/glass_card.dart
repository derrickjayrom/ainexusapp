import 'dart:ui';
import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.rLg,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.75),
            borderRadius: AppRadius.rLg,
            border: Border.all(
              color: AppColors.stroke.withValues(alpha: 0.8),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';

class Pill extends StatelessWidget {
  const Pill(this.label, {super.key, this.isActive = false, this.onTap});

  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary.withValues(alpha: 0.22)
            : AppColors.surface2.withValues(alpha: 0.9),
        borderRadius: AppRadius.rLg,
        border: Border.all(
          color: isActive ? AppColors.primary : AppColors.stroke,
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 13,
          color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    return onTap == null
        ? child
        : InkWell(borderRadius: AppRadius.rLg, onTap: onTap, child: child);
  }
}

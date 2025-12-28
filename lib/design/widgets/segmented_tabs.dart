import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';

class SegmentedTabs extends StatelessWidget {
  const SegmentedTabs({
    super.key,
    required this.left,
    required this.right,
    required this.isLeftSelected,
    required this.onLeft,
    required this.onRight,
  });

  final String left;
  final String right;
  final bool isLeftSelected;
  final VoidCallback onLeft;
  final VoidCallback onRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.surface2.withValues(alpha: 0.9),
        borderRadius: AppRadius.rLg,
        border: Border.all(color: AppColors.stroke),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SegItem(
              label: left,
              selected: isLeftSelected,
              onTap: onLeft,
            ),
          ),
          Expanded(
            child: _SegItem(
              label: right,
              selected: !isLeftSelected,
              onTap: onRight,
            ),
          ),
        ],
      ),
    );
  }
}

class _SegItem extends StatelessWidget {
  const _SegItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.stroke.withValues(alpha: 0.9)
              : Colors.transparent,
          borderRadius: AppRadius.rLg,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: selected ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';

class SkeletonTile extends StatelessWidget {
  const SkeletonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stroke.withValues(alpha: 0.85)),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.surface2.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.stroke),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: double.infinity,
                  color: AppColors.surface2,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 14,
                  width: double.infinity,
                  color: AppColors.surface2,
                ),
                const SizedBox(height: 10),
                Container(height: 12, width: 140, color: AppColors.surface2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.timeAgo,
    this.isLive = false,
    this.onTap,
    this.onBookmark,
    this.compact = false,
  });

  final String title;
  final String subtitle;
  final String source;
  final String timeAgo;
  final bool isLive;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: AppRadius.rLg,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.75),
          borderRadius: AppRadius.rLg,
          border: Border.all(color: AppColors.stroke.withValues(alpha: 0.85)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Thumb(live: isLive),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isLive)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4D4D).withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "LIVE",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  Text(
                    title,
                    maxLines: compact ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: t.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: t.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$source • $timeAgo",
                    style: t.bodyMedium?.copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: onBookmark,
              icon: const Icon(
                Icons.bookmark_border,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({required this.live});
  final bool live;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: RadialGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.35),
            AppColors.surface2.withValues(alpha: 0.95),
          ],
        ),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Icon(
        live ? Icons.auto_awesome : Icons.article_outlined,
        color: AppColors.textPrimary,
      ),
    );
  }
}

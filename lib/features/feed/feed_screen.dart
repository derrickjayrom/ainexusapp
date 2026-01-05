import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../design/tokens/app_spacing.dart';
import '../../design/widgets/news_card.dart';
import '../feed/state/feed_providers.dart';
import '../saved/state/saved_controller.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedProvider);
    final savedIds = ref.watch(savedIdsProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.xl,
        ),
        children: [
          feed.when(
            loading: () => const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(child: Text('Failed to load feed: $e')),
            ),
            data: (items) => Column(
              children: [
                for (final a in items) ...[
                  NewsCard(
                    title: a.title,
                    subtitle: a.subtitle,
                    source: a.source,
                    timeAgo: a.timeAgo,
                    isLive: a.isLive,
                    isBookmarked: savedIds.contains(a.id),
                    onBookmark: () =>
                        ref.read(savedIdsProvider.notifier).toggle(a.id),
                    onTap: () {}, // later: navigate to details
                  ),
                  const SizedBox(height: 12),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

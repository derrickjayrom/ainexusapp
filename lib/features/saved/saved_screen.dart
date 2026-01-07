import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../design/tokens/app_spacing.dart';
import '../../design/widgets/news_card.dart';
import '../feed/state/feed_providers.dart';
import 'state/saved_controller.dart';

class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedControllerProvider);
    final savedAsync = ref.watch(savedIdsProvider);
    final savedIds = savedAsync.value ?? <String>{};

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
              child: Center(child: Text('Failed to load saved: $e')),
            ),
            data: (state) {
              final items = state.items;
              final savedItems = items
                  .where((a) => savedIds.contains(a.id))
                  .toList();

              if (savedItems.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Center(child: Text('No saved items yet')),
                );
              }

              return Column(
                children: [
                  for (final a in savedItems) ...[
                    NewsCard(
                      title: a.title,
                      subtitle: a.subtitle,
                      source: a.source,
                      timeAgo: a.timeAgo,
                      isLive: a.isLive,
                      isBookmarked: true,
                      onBookmark: () {
                        ref
                            .read(savedIdsProvider.notifier)
                            .toggle(a.id); // unsave
                        ref.read(feedControllerProvider.notifier).refresh();
                      },
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

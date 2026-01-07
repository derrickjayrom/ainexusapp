import 'package:ainexusapp/design/widgets/skeleton_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../design/tokens/app_spacing.dart';
import '../../design/widgets/news_card.dart';

import '../saved/state/saved_controller.dart';
import '../../app/core/theme/theme_providers.dart';
import 'state/feed_providers.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  late final ScrollController _sc;

  @override
  void initState() {
    super.initState();
    _sc = ScrollController()
      ..addListener(() {
        final pos = _sc.position;
        if (!pos.hasPixels || !pos.hasContentDimensions) return;

        // load more when within 300px of bottom
        if (pos.pixels >= (pos.maxScrollExtent - 300)) {
          ref.read(feedControllerProvider.notifier).loadMore();
        }
      });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(feedControllerProvider);
    final savedAsync = ref.watch(savedIdsProvider);
    final savedIds = savedAsync.value ?? <String>{};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ai_Nexus'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(feedControllerProvider.notifier).refresh(),
          child: feed.when(
            loading: () => ListView.separated(
              controller: _sc,
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.xl,
              ),
              itemBuilder: (_, _) => const SkeletonTile(),
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemCount: 6,
            ),
            error: (e, _) => ListView(
              controller: _sc,
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.xl,
              ),
              children: [
                const SizedBox(height: 24),
                Center(child: Text('Failed to load feed: $e')),
                const SizedBox(height: 12),
                Center(
                  child: OutlinedButton(
                    onPressed: () =>
                        ref.read(feedControllerProvider.notifier).refresh(),
                    child: const Text('Retry'),
                  ),
                ),
              ],
            ),
            data: (state) {
              final items = state.items;

              return ListView.separated(
                controller: _sc,
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.lg,
                  AppSpacing.xl,
                ),
                itemCount: items.length + 1, // + footer
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index == items.length) {
                    // footer
                    if (state.isLoadingMore) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (!state.hasMore) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: Text('You’re all caught up')),
                      );
                    }
                    return const SizedBox(height: 12);
                  }

                  final a = items[index];
                  return NewsCard(
                    title: a.title,
                    subtitle: a.subtitle,
                    source: a.source,
                    timeAgo: a.timeAgo,
                    isLive: a.isLive,
                    isBookmarked: savedIds.contains(a.id),
                    onBookmark: () =>
                        ref.read(savedIdsProvider.notifier).toggle(a.id),
                    onTap: () {},
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

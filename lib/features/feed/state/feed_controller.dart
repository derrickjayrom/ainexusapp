import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/article.dart';
import 'repository_providers.dart';

class FeedState {
  const FeedState({
    required this.items,
    required this.page,
    required this.hasMore,
    required this.isLoadingMore,
  });

  final List<Article> items;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  FeedState copyWith({
    List<Article>? items,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return FeedState(
      items: items ?? this.items,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  static const empty = FeedState(
    items: <Article>[],
    page: 0,
    hasMore: true,
    isLoadingMore: false,
  );
}

class FeedController extends AsyncNotifier<FeedState> {
  static const int _pageSize = 10;

  @override
  Future<FeedState> build() async {
    final repo = ref.watch(newsRepositoryProvider);
    final first = await repo.fetchFeedPage(page: 0, pageSize: _pageSize);
    return FeedState(
      items: first,
      page: 0,
      hasMore: first.length == _pageSize,
      isLoadingMore: false,
    );
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() async {
      final repo = ref.read(newsRepositoryProvider);
      final first = await repo.fetchFeedPage(page: 0, pageSize: _pageSize);
      return FeedState(
        items: first,
        page: 0,
        hasMore: first.length == _pageSize,
        isLoadingMore: false,
      );
    });
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));

    state = await AsyncValue.guard(() async {
      final repo = ref.read(newsRepositoryProvider);
      final nextPage = current.page + 1;
      final nextItems = await repo.fetchFeedPage(
        page: nextPage,
        pageSize: _pageSize,
      );

      final merged = <Article>[...current.items, ...nextItems];

      return current.copyWith(
        items: merged,
        page: nextPage,
        hasMore: nextItems.length == _pageSize,
        isLoadingMore: false,
      );
    });
  }
}

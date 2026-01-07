import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/article.dart';
import 'feed_controller.dart';

final feedControllerProvider = AsyncNotifierProvider<FeedController, FeedState>(
  FeedController.new,
);

// Handy derived provider for other screens (Saved) to read items
final feedItemsProvider = Provider<List<Article>>((ref) {
  final s = ref.watch(feedControllerProvider);
  return s.maybeWhen(data: (v) => v.items, orElse: () => const []);
});

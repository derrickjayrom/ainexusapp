import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/news_repository.dart';
import '../data/fake_news_repository.dart';
import '../domain/article.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return FakeNewsRepository();
});

final feedProvider = FutureProvider<List<Article>>((ref) async {
  final repo = ref.watch(newsRepositoryProvider);
  return repo.fetchFeed();
  
});
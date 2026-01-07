import '../domain/article.dart';

abstract class NewsRepository {
  Future<List<Article>> fetchFeedPage({
    required int page,
    required int pageSize,
  });
}

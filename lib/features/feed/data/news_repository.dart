import 'package:ainexusapp/features/feed/domain/article.dart';

abstract class NewsRepository {
  Future<List<Article>> fetchFeed();
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/news_repository.dart';
import '../data/fake_news_repository.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return FakeNewsRepository();
});

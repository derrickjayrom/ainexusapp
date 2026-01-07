import '../domain/article.dart';
import 'news_repository.dart';

class FakeNewsRepository implements NewsRepository {
  final List<Article> _all = List.generate(40, (i) {
    final n = i + 1;
    return Article(
      id: 'a$n',
      title: 'AI Update #$n: Major model and tool changes',
      subtitle:
          'Summary for item #$n. This is placeholder text for production scaffolding.',
      source: (n % 2 == 0) ? 'TechCrunch' : 'The Verge',
      timeAgo: '${(n % 12) + 1}h ago',
      isLive: n == 1,
      type: ContentType.article,
    );
  });

  @override
  Future<List<Article>> fetchFeedPage({
    required int page,
    required int pageSize,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    final start = page * pageSize;
    if (start >= _all.length) return <Article>[];
    final end = (start + pageSize).clamp(0, _all.length);
    return _all.sublist(start, end);
  }
}

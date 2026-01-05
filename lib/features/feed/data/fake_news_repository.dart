import '../domain/article.dart';
import 'news_repository.dart';

class FakeNewsRepository implements NewsRepository {
  @override
  Future<List<Article>> fetchFeed() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return const [
      Article(
        id: 'a1',
        title: 'GPT-5 Official Release Date Confirmed for Late 2024',
        subtitle:
            'Major updates expected across reasoning and multimodal capabilities.',
        source: 'OpenAI',
        timeAgo: '12m ago',
        isLive: true,
      ),
      Article(
        id: 'a2',
        title: 'Midjourney V7 Alpha Testing Begins with Video Support',
        subtitle:
            'Users report stunning consistency improvements and better motion handling.',
        source: 'The Verge',
        timeAgo: '45m ago',
      ),
      Article(
        id: 'a3',
        title: 'Copilot X Integration Now Live in VS Code',
        subtitle:
            'Seamless context awareness for multi-file edits and refactors.',
        source: 'TechCrunch',
        timeAgo: '2h ago',
      ),
      Article(
        id: 'a4',
        title:
            'Claude 3.5 Opus just dropped: Outperforms GPT-4 on Math benchmarks',
        subtitle: 'Significant reasoning improvements and 200k context window.',
        source: 'Product Hunt',
        timeAgo: '3h ago',
        type: ContentType.tool,
      ),
      Article(
        id: 'a5',
        title: 'Global AI Regulation Summit Concludes in Geneva',
        subtitle:
            'World leaders agree on new safety principles and reporting expectations.',
        source: 'Nature',
        timeAgo: '1d ago',
      ),
    ];
  }
}

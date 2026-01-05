enum ContentType { article, tool, video }

class Article {
  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.timeAgo,
    this.isLive = false,
    this.type = ContentType.article,
  });

  final String id;
  final String title;
  final String subtitle;
  final String source;
  final String timeAgo;
  final bool isLive;
  final ContentType type;
}

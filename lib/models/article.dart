// File: lib/models/article.dart
class Article {
  final String? title;
  final String? description;
  final String? url;
  final String? imageUrl;
  final String? author;
  final String? source;
  final DateTime? publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.author,
    required this.source,
    required this.publishedAt,
  });

  // Factory constructor to create an instance from JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      imageUrl: json['urlToImage'] as String?,
      author: json['author'] as String?,
      source: (json['source'] != null) ? json['source']['name'] as String? : null,
      publishedAt: (json['publishedAt'] != null)
          ? DateTime.tryParse(json['publishedAt'])
          : null,
    );
  }

  // Override toString for better logging/debugging
  @override
  String toString() {
    return 'Article(title: $title, source: $source, publishedAt: $publishedAt)';
  }
}

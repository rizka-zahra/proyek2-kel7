class ArticleModel {
  final int id;
  final String title;
  final String category;
  final String excerpt;
  final String content;
  final String imageUrl;
  final int readMinutes;
  final String author;
  final String tag;

  ArticleModel({
    required this.id,
    required this.title,
    required this.category,
    required this.excerpt,
    required this.content,
    required this.imageUrl,
    required this.readMinutes,
    required this.author,
    required this.tag,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      excerpt: json['excerpt'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['image_url'] ?? '',
      readMinutes: json['read_minutes'] ?? 0,
      author: json['author'] ?? '',
      tag: json['tag'] ?? '',
    );
  }
}
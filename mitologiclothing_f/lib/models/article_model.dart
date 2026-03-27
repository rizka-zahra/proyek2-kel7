class ArticleModel {
  final int id;
  final int categoryId;
  final String title;
  final String content;
  final String? imageUrl;
  final String? publishedDate;

  ArticleModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.content,
    this.imageUrl,
    this.publishedDate,
  });

  String get excerpt {
    final plainText = content.trim();
    if (plainText.isEmpty) return '';
    if (plainText.length <= 100) return plainText;
    return '${plainText.substring(0, 100)}...';
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? 0,
      categoryId: json['kategori_id'] ?? 0,
      title: json['judul'] ?? '',
      content: json['isi'] ?? '',
      imageUrl: json['gambar'],
      publishedDate: json['tanggal_publish'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kategori_id': categoryId,
      'judul': title,
      'isi': content,
      'gambar': imageUrl,
      'tanggal_publish': publishedDate,
    };
  }
}
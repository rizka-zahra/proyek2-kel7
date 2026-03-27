import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();

  List<ArticleModel> articles = [];
  bool isLoading = false;
  String? errorMessage;
  String searchQuery = '';

  Future<void> fetchArticles() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      articles = await _articleService.getArticles();
    } catch (e) {
      errorMessage = 'Terjadi kesalahan saat mengambil data artikel';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String value) {
    searchQuery = value;
    notifyListeners();
  }

  List<ArticleModel> get filteredArticles {
    if (searchQuery.trim().isEmpty) {
      return articles;
    }

    final keyword = searchQuery.toLowerCase();

    return articles.where((article) {
      return article.title.toLowerCase().contains(keyword) ||
          article.content.toLowerCase().contains(keyword) ||
          article.excerpt.toLowerCase().contains(keyword) ||
          article.categoryId.toString().contains(keyword);
    }).toList();
  }
}
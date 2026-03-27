import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/article_model.dart';
import '../../viewmodels/article_viewmodel.dart';
import 'article_detail_page.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<ArticleViewModel>().fetchArticles();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _categoryLabel(int categoryId) {
    switch (categoryId) {
      case 1:
        return 'Kategori 1';
      case 2:
        return 'Kategori 2';
      case 3:
        return 'Kategori 3';
      case 4:
        return 'Kategori 4';
      default:
        return 'Kategori';
    }
  }

  @override
  Widget build(BuildContext context) {
    final articleVM = context.watch<ArticleViewModel>();
    final articles = articleVM.filteredArticles;

    if (articleVM.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (articleVM.errorMessage != null) {
      return Center(child: Text(articleVM.errorMessage!));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 18),
          _buildSearch(articleVM),
          const SizedBox(height: 22),
          if (articles.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text('Artikel belum tersedia'),
              ),
            )
          else ...[
            _buildFeaturedArticle(context, articles.first),
            const SizedBox(height: 22),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: articles.length > 1 ? articles.length - 1 : 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final article = articles[index + 1];
                return _buildArticleCard(context, article);
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FB),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFD9E1EE)),
          ),
          child: const Icon(
            Icons.help_outline,
            color: Color(0xFF8EA1BF),
            size: 28,
          ),
        ),
        const SizedBox(width: 14),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artikel',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2A44),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Artikel dan informasi terbaru',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9BA9C3),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearch(ArticleViewModel articleVM) {
    return TextField(
      controller: _searchController,
      onChanged: articleVM.setSearchQuery,
      decoration: InputDecoration(
        hintText: 'Cari Artikel',
        prefixIcon: const Icon(Icons.search, color: Color(0xFF9097A6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF304A83)),
        ),
      ),
    );
  }

  Widget _buildFeaturedArticle(BuildContext context, ArticleModel article) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticleDetailPage(article: article),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 240,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _articleImage(article.imageUrl),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.10),
                            Colors.black.withValues(alpha: 0.75),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      right: 18,
                      bottom: 18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _categoryLabel(article.categoryId),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            article.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.excerpt,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: Color(0xFF9A9A9A),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          article.publishedDate ?? '-',
                          style: const TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCard(BuildContext context, ArticleModel article) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticleDetailPage(article: article),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 165,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(child: _articleImage(article.imageUrl)),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.90),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _categoryLabel(article.categoryId).toUpperCase(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF767676),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                article.excerpt,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.55,
                  color: Color(0xFF7A7A7A),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Text(
                article.publishedDate ?? '-',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9A9A9A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _articleImage(String? imagePath) {
    final safePath = imagePath ?? '';
    final isNetwork = safePath.startsWith('http');

    if (safePath.isEmpty) {
      return Container(
        color: const Color(0xFFECECEC),
        child: const Center(
          child: Icon(Icons.image_not_supported_outlined),
        ),
      );
    }

    if (isNetwork) {
      return Image.network(
        safePath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, _) {
          return Container(
            color: const Color(0xFFECECEC),
            child: const Center(
              child: Icon(Icons.image_not_supported_outlined),
            ),
          );
        },
      );
    }

    return Image.asset(
      safePath,
      fit: BoxFit.cover,
      errorBuilder: (_, __, _) {
        return Container(
          color: const Color(0xFFECECEC),
          child: const Center(
            child: Icon(Icons.image_not_supported_outlined),
          ),
        );
      },
    );
  }
}
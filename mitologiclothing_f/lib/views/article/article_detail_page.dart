import 'package:flutter/material.dart';
import '../../models/article_model.dart';
import '../../widgets/menu_drawer.dart';
import '../../widgets/navbar_home.dart';
import '../home/home_page.dart';
import '../more/about_page.dart';
import '../more/faq_page.dart';
import '../more/product_info_page.dart';
import 'article_page.dart';

class ArticleDetailPage extends StatefulWidget {
  final ArticleModel article;

  const ArticleDetailPage({
    super.key,
    required this.article,
  });

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final int _currentIndex = 2;

  void _handleBottomNav(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(initialIndex: index),
      ),
    );
  }

  void _openPage(Widget page) {
    Navigator.pop(context);
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    });
  }

  void _handleDrawerNavigation(String menu) {
    switch (menu) {
      case 'beranda':
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 0),
          ),
        );
        break;

      case 'belanja':
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 2),
          ),
        );
        break;

      case 'artikel':
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ArticlePage(),
          ),
        );
        break;

      case 'tentang_kami':
        _openPage(const AboutPage());
        break;

      case 'informasi_produk':
        _openPage(const ProductInfoPage());
        break;

      case 'faq':
        _openPage(const FaqPage());
        break;
    }
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
    final article = widget.article;
    final imagePath = article.imageUrl ?? '';
    final isNetwork = imagePath.startsWith('http');

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF8F7FB),
      endDrawer: MenuDrawer(
        onItemTap: _handleDrawerNavigation,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 72,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 42,
              width: 42,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'MITODOLOGI CLOTHING',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF5C6F97),
              size: 30,
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF304A83),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back, size: 18, color: Color(0xFF304A83)),
                  SizedBox(width: 6),
                  Text(
                    'Kembali',
                    style: TextStyle(
                      color: Color(0xFF304A83),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 24,
                height: 1.25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222222),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: Color(0xFF9A9A9A),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    article.publishedDate ?? '-',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8A8A8A),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEFECEC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _categoryLabel(article.categoryId),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3A3A3A),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: imagePath.isEmpty
                    ? Container(
                        color: const Color(0xFFECECEC),
                        child: const Center(
                          child: Icon(Icons.image_not_supported_outlined),
                        ),
                      )
                    : isNetwork
                        ? Image.network(
                            imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                color: const Color(0xFFECECEC),
                                child: const Center(
                                  child: Icon(Icons.image_not_supported_outlined),
                                ),
                              );
                            },
                          )
                        : Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                color: const Color(0xFFECECEC),
                                child: const Center(
                                  child: Icon(Icons.image_not_supported_outlined),
                                ),
                              );
                            },
                          ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Gambar ilustrasi untuk ${article.title}',
              style: const TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Color(0xFF9A9A9A),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              article.excerpt,
              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              article.content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.8,
                color: Color(0xFF5F5F5F),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(
        currentIndex: _currentIndex,
        onTap: _handleBottomNav,
      ),
    );
  }
}
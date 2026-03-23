import 'package:flutter/material.dart';
import '../../widgets/menu_drawer.dart';
import '../../widgets/navbar_home.dart';
import '../home/home_page.dart';
import 'faq_page.dart';
import 'product_info_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _handleBottomNav(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(initialIndex: index),
      ),
    );
  }

  void _handleDrawerNavigation(String menu) {
    Navigator.pop(context);

    switch (menu) {
      case 'beranda':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 0),
          ),
        );
        break;

      case 'belanja':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 2),
          ),
        );
        break;

      case 'artikel':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 3),
          ),
        );
        break;

      case 'tentang_kami':
        break;

      case 'informasi_produk':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ProductInfoPage(),
          ),
        );
        break;

      case 'faq':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const FaqPage(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(22, 26, 22, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFE4E7EE),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Tentang Mitodologi\nClothing',
                    style: TextStyle(
                      fontSize: 22,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            const Text(
              'Mitologi Clothing adalah vendor clothing asal Indramayu yang berdiri sejak 2022 dan bergerak dalam produksi berbagai jenis seragam dan merchandise untuk organisasi maupun instansi.',
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
                color: Color(0xFF5C5C5C),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Dengan dukungan tim berpengalaman, peralatan evaluasi berkelanjutan, Mitologi terus bertransformasi menjadi entitas yang profesional dan terpercaya dalam memfasilitasi kebutuhan industri merchandise demi kepuasan konsumen.',
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
                color: Color(0xFF5C5C5C),
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
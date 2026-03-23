import 'package:flutter/material.dart';
import '../../widgets/navbar_home.dart';
import '../../widgets/menu_drawer.dart';
import '../more/about_page.dart';
import '../more/faq_page.dart';
import '../more/product_info_page.dart';
import '../more/pesanan_page.dart';
import 'home_view.dart';
import '../article/article_page.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;

  const HomePage({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = const [
    HomeView(),
    Center(child: Text('Menu Page')),
    SizedBox(),
    ArticlePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _changeTab(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PesananPage(),
        ),
      );
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  void _openPage(Widget page) {
    Navigator.pop(context);
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    });
  }

  void _handleDrawerNavigation(String menu) {
    switch (menu) {
      case 'beranda':
        Navigator.pop(context);
        _changeTab(0);
        break;

      case 'belanja':
        Navigator.pop(context);
        Future.delayed(Duration.zero, () {
          if (!mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PesananPage(),
            ),
          );
        });
        break;

      case 'artikel':
        Navigator.pop(context);
        _changeTab(3);
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
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.storefront_outlined,
                  size: 38,
                  color: Color(0xFF5C6F97),
                );
              },
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
      body: _pages[_currentIndex],
      bottomNavigationBar: Navbar(
        currentIndex: _currentIndex,
        onTap: _changeTab,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../widgets/navbar_home.dart';
import '../../widgets/menu_drawer.dart';
import '../../widgets/profile_quick_menu.dart';
import '../../services/access_service.dart';
import '../../models/user_access_model.dart';
import '../auth/access_request_page.dart';
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
    SizedBox(),
    ArticlePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = _safeIndex(widget.initialIndex);
  }

  int _safeIndex(int index) {
    if (index < 0 || index >= _pages.length) {
      return 0;
    }
    return index;
  }

  Future<void> _openBelanjaWithLoginCheck() async {
    final isLoggedIn = await AccessService.isLoggedIn();

    if (!isLoggedIn) {
      final result = await Navigator.push<bool>(
        context,
        MaterialPageRoute(
          builder: (_) => const AccessRequestPage(),
        ),
      );

      if (result != true || !mounted) return;
    }

    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PesananPage(),
      ),
    );
  }

  Future<void> _openProfileInfo() async {
    final UserAccessModel? user = await AccessService.getUser();

    if (!mounted) return;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data pengguna belum tersedia'),
        ),
      );
      return;
    }

    await showProfileQuickMenu(context, user);
  }

  void _changeTab(int index) {
    if (index == 1) {
      _openBelanjaWithLoginCheck();
      return;
    }

    final safeIndex = _safeIndex(index);

    setState(() {
      _currentIndex = safeIndex;
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
          _openBelanjaWithLoginCheck();
        });
        break;

      case 'artikel':
        Navigator.pop(context);
        _changeTab(2);
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
    final int safeCurrentIndex = _safeIndex(_currentIndex);

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
            onPressed: _openProfileInfo,
            icon: const Icon(
              Icons.person_outline,
              color: Color(0xFF8B90A4),
              size: 28,
            ),
          ),
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
      body: _pages[safeCurrentIndex],
      bottomNavigationBar: Navbar(
        currentIndex: safeCurrentIndex,
        onTap: _changeTab,
      ),
    );
  }
}
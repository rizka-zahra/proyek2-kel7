import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/product_viewmodel.dart';
import '../../widgets/menu_drawer.dart';
import '../../widgets/navbar_home.dart';
import '../home/home_page.dart';
import 'about_page.dart';
import 'faq_page.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<ProductViewModel>().fetchProducts();
    });
  }

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
            builder: (_) => const HomePage(initialIndex: 3),
          ),
        );
        break;

      case 'tentang_kami':
        _openPage(const AboutPage());
        break;

      case 'informasi_produk':
        Navigator.pop(context);
        break;

      case 'faq':
        _openPage(const FaqPage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final productVM = context.watch<ProductViewModel>();

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
      body: productVM.isLoading
          ? const Center(child: CircularProgressIndicator())
          : productVM.errorMessage != null
              ? Center(child: Text(productVM.errorMessage!))
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Produk',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2A44),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ...productVM.groupedProducts.entries.map((entry) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF505A6B),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: entry.value.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                childAspectRatio: 0.82,
                              ),
                              itemBuilder: (context, index) {
                                final product = entry.value[index];
                                return _buildProductImage(product.imageUrl);
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
      bottomNavigationBar: Navbar(
        currentIndex: _currentIndex,
        onTap: _handleBottomNav,
      ),
    );
  }

  Widget _buildProductImage(String imagePath) {
    final bool isNetwork = imagePath.startsWith('http');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: isNetwork
            ? Image.network(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.image_not_supported_outlined),
                  );
                },
              )
            : Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.image_not_supported_outlined),
                  );
                },
              ),
      ),
    );
  }
}
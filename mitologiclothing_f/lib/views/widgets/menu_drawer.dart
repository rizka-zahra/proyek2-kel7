import 'package:flutter/material.dart';
import '../home/home_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _menuItem(context, 'Beranda', const HomePage()),
              //   _menuItem(context, 'Belanja', const ShoppingPage()),
              //   _menuItem(context, 'Artikel', const ArticlePage()),
              //   _menuItem(context, 'Tentang Kami', const HomePage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}

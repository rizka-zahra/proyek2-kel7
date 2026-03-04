import 'package:flutter/material.dart';
import '../home/home_page.dart'; // Pastikan import halaman yang sesuai

class Navbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navbar({Key? key, required this.currentIndex, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF2F3F73),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Belanja',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Artikel'),
      ],
    );
  }
}

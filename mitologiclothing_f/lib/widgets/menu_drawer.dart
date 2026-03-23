import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final Function(String) onItemTap;

  const MenuDrawer({
    super.key,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.62,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _menuItem('Beranda', () => onItemTap('beranda')),
              _menuItem('Belanja', () => onItemTap('belanja')),
              _menuItem('Artikel', () => onItemTap('artikel')),
              _menuItem('Tentang Kami', () => onItemTap('tentang_kami')),
              _menuItem('Informasi Produk', () => onItemTap('informasi_produk')),
              _menuItem('FAQ', () => onItemTap('faq')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: Color(0xFF5E5E5E),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
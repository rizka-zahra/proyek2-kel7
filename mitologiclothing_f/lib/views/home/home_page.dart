import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/navbar_home.dart';
import 'home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // final List<Widget> _pages = const [
  //   HomeView(),
  //   Center(child: Text('Menu Page')),
  //   Center(child: Text('Belanja Page')),
  //   Center(child: Text('Artikel Page')),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 36),
            const SizedBox(width: 10),
            const Text(
              'MITODOLOGI CLOTHING',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // body: _pages[_currentIndex],
      bottomNavigationBar: Navbar(
        // Menggunakan Navbar yang sudah dipisah
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

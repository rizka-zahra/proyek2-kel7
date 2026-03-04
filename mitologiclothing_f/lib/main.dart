import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home/home_page.dart';
import 'viewmodels/product_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ProductViewModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

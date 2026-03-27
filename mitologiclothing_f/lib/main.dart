import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/product_viewmodel.dart';
import 'viewmodels/article_viewmodel.dart';
import 'viewmodels/cart_viewmodel.dart';
import 'viewmodels/order_history_viewmodel.dart';
import 'views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductViewModel>(
          create: (_) => ProductViewModel(),
        ),
        ChangeNotifierProvider<ArticleViewModel>(
          create: (_) => ArticleViewModel(),
        ),
        ChangeNotifierProvider<CartViewModel>(
          create: (_) => CartViewModel(),
        ),
        ChangeNotifierProvider<OrderHistoryViewModel>(
          create: (_) => OrderHistoryViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mitodologi Clothing',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF8F7FB),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2F4A8A),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
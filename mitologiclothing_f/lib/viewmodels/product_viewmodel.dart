import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  List<String> _products = [];

  List<String> get products => _products;

  void fetchProducts() {
    _products = [
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 4',
    ]; // Ganti dengan data produk nyata
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> products = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      products = await _productService.getProducts();
    } catch (e) {
      errorMessage = 'Terjadi kesalahan saat mengambil data produk';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Map<String, List<ProductModel>> get groupedProducts {
    final Map<String, List<ProductModel>> grouped = {};

    for (final product in products) {
      if (!grouped.containsKey(product.category)) {
        grouped[product.category] = [];
      }
      grouped[product.category]!.add(product);
    }

    return grouped;
  }
}
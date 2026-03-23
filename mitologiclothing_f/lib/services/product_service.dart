import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 700));

    return [
      ProductModel(
        id: 1,
        name: 'Hoodie 1',
        category: 'Hoodie',
        imageUrl: 'assets/images/products/hoodie1.jpg',
        description: 'Hoodie custom',
      ),
      ProductModel(
        id: 2,
        name: 'Hoodie 2',
        category: 'Hoodie',
        imageUrl: 'assets/images/products/hoodie2.jpg',
        description: 'Hoodie custom',
      ),
      ProductModel(
        id: 3,
        name: 'Kaos 1',
        category: 'Kaos',
        imageUrl: 'assets/images/products/kaos1.jpeg',
        description: 'Kaos custom',
      ),
      ProductModel(
        id: 4,
        name: 'Kaos 2',
        category: 'Kaos',
        imageUrl: 'assets/images/products/kaos2.jpeg',
        description: 'Kaos custom',
      ),
    ];
  }
}
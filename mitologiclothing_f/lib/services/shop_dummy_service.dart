import '../models/cart_item_model.dart';
import '../models/color_catalog_model.dart';
import '../models/shop_item_model.dart';

class ShopDummyService {
  static List<ShopItemModel> getProducts() {
    return const [
      ShopItemModel(
        id: 1,
        name: 'T-Shirt Streetwear',
        category: 'KAOS',
        imageUrl: 'assets/images/products/kaos1.jpeg',
        price: 149000,
        stock: 25,
        description: 'Kaos premium untuk kebutuhan custom clothing.',
      ),
      ShopItemModel(
        id: 2,
        name: 'Hoodie Fleece',
        category: 'HOODIE',
        imageUrl: 'assets/images/products/hoodie1.jpg',
        price: 299000,
        stock: 18,
        description: 'Hoodie fleece nyaman untuk tampilan kasual.',
      ),
      ShopItemModel(
        id: 3,
        name: 'Jaket Bomber',
        category: 'JAKET',
        imageUrl: 'assets/images/products/hoodie2.jpg',
        price: 399000,
        stock: 12,
        description: 'Jaket bomber tampil modern dan rapi.',
      ),
      ShopItemModel(
        id: 4,
        name: 'Topi Baseball',
        category: 'AKSESORIS',
        imageUrl: 'assets/images/products/kaos2.jpeg',
        price: 89000,
        stock: 30,
        description: 'Topi baseball untuk pelengkap outfit.',
      ),
    ];
  }

  static List<ColorCatalogModel> getColors() {
    return const [
      ColorCatalogModel(name: 'Midnight Black', hexCode: '#1A1A1A'),
      ColorCatalogModel(name: 'Navy Blue', hexCode: '#000080'),
      ColorCatalogModel(name: 'Maroon Red', hexCode: '#800000'),
      ColorCatalogModel(name: 'Forest Green', hexCode: '#228B22'),
      ColorCatalogModel(name: 'Ash Grey', hexCode: '#B2BEB5'),
      ColorCatalogModel(name: 'Mustard Yellow', hexCode: '#E1AD01'),
      ColorCatalogModel(name: 'Classic White', hexCode: '#FFFFFF'),
      ColorCatalogModel(name: 'Olive Drab', hexCode: '#6B8E23'),
      ColorCatalogModel(name: 'Royal Purple', hexCode: '#7851A9'),
      ColorCatalogModel(name: 'Terracotta', hexCode: '#E2725B'),
    ];
  }

  static List<CartItemModel> getCartItems() {
    final products = getProducts();

    return [
      CartItemModel(
        product: products[0],
        size: 'L',
        color: 'Hitam',
        material: 'Cotton Combed 30s',
        quantity: 1,
        selected: true,
      ),
      CartItemModel(
        product: products[1],
        size: 'M',
        color: 'Putih',
        material: 'Fleece Premium',
        quantity: 2,
        selected: true,
      ),
      CartItemModel(
        product: products[2],
        size: 'L',
        color: 'Biru',
        material: 'Denim',
        quantity: 1,
        selected: true,
      ),
    ];
  }
}
import '../models/color_catalog_model.dart';
import '../models/shop_item_model.dart';

class ShopDummyService {
  static List<ShopItemModel> getPriceLists() {
    return const [
      ShopItemModel(
        id: 1,
        kategoriBahanId: 1,
        categoryName: 'Cotton Combed',
        imageUrl: 'assets/images/products/kaos1.jpeg',
        price: 149000,
        description:
            'Bahan cotton combed 30s yang nyaman dipakai untuk kaos custom harian.',
        availableColors: ['Hitam', 'Putih', 'Merah', 'Navy'],
        availableSizes: ['S', 'M', 'L', 'XL'],
      ),
      ShopItemModel(
        id: 2,
        kategoriBahanId: 2,
        categoryName: 'Fleece',
        imageUrl: 'assets/images/products/hoodie1.jpg',
        price: 299000,
        description:
            'Bahan fleece premium, cocok untuk hoodie custom dengan tekstur lembut.',
        availableColors: ['Hitam', 'Abu', 'Cream'],
        availableSizes: ['M', 'L', 'XL'],
      ),
      ShopItemModel(
        id: 3,
        kategoriBahanId: 3,
        categoryName: 'Parasut',
        imageUrl: 'assets/images/products/hoodie2.jpg',
        price: 399000,
        description:
            'Bahan parasut ringan untuk jaket custom dan kebutuhan outdoor.',
        availableColors: ['Hitam', 'Biru', 'Hijau Army'],
        availableSizes: ['M', 'L', 'XL'],
      ),
      ShopItemModel(
        id: 4,
        kategoriBahanId: 4,
        categoryName: 'Drill',
        imageUrl: 'assets/images/products/kaos2.jpeg',
        price: 89000,
        description:
            'Bahan drill cocok untuk workshirt dan kemeja custom dengan tampilan rapi.',
        availableColors: ['Khaki', 'Hitam', 'Olive'],
        availableSizes: ['S', 'M', 'L', 'XL'],
      ),
    ];
  }

  static List<ShopItemModel> getStockItems() {
    return const [
      ShopItemModel(
        id: 1,
        kategoriBahanId: 1,
        categoryName: 'Cotton Combed',
        detailBahan: 'Cotton Combed 30s',
        imageUrl: 'assets/images/products/kaos1.jpeg',
        stock: 25,
        description: 'Stok bahan cotton combed 30s untuk produksi kaos custom.',
      ),
      ShopItemModel(
        id: 2,
        kategoriBahanId: 2,
        categoryName: 'Fleece',
        detailBahan: 'Fleece Premium',
        imageUrl: 'assets/images/products/hoodie1.jpg',
        stock: 18,
        description: 'Stok fleece premium untuk produksi hoodie custom.',
      ),
      ShopItemModel(
        id: 3,
        kategoriBahanId: 3,
        categoryName: 'Parasut',
        detailBahan: 'Parasut Taslan',
        imageUrl: 'assets/images/products/hoodie2.jpg',
        stock: 12,
        description: 'Stok bahan parasut taslan untuk jaket custom.',
      ),
      ShopItemModel(
        id: 4,
        kategoriBahanId: 4,
        categoryName: 'Drill',
        detailBahan: 'American Drill',
        imageUrl: 'assets/images/products/kaos2.jpeg',
        stock: 30,
        description: 'Stok bahan american drill untuk kemeja atau workshirt.',
      ),
    ];
  }

  static List<ShopItemModel> getProducts() => getPriceLists();

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
}
class ShopItemModel {
  final int id;
  final String name;
  final String category;
  final String imageUrl;
  final int price;
  final int stock;
  final String description;

  const ShopItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.stock,
    required this.description,
  });
}
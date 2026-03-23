import 'shop_item_model.dart';

class CartItemModel {
  final ShopItemModel product;
  final String size;
  final String color;
  final String material;
  int quantity;
  bool selected;

  CartItemModel({
    required this.product,
    required this.size,
    required this.color,
    required this.material,
    required this.quantity,
    this.selected = true,
  });

  int get subtotal => product.price * quantity;
}
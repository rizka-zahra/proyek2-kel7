import 'package:flutter/material.dart';
import '../models/cart_item_model.dart';
import '../models/shop_item_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => List.unmodifiable(_items);

  List<CartItemModel> get selectedItems =>
      _items.where((item) => item.selected).toList();

  int get totalSelectedPrice =>
      selectedItems.fold(0, (sum, item) => sum + item.subtotal);

  void addToCart({
    required ShopItemModel product,
    required String size,
    required String color,
    required String material,
    required int quantity,
  }) {
    final index = _items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.size == size &&
          item.color == color &&
          item.material == material,
    );

    if (index != -1) {
      _items[index].quantity += quantity;
    } else {
      _items.add(
        CartItemModel(
          product: product,
          size: size,
          color: color,
          material: material,
          quantity: quantity,
          selected: true,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(CartItemModel item) {
    _items.remove(item);
    notifyListeners();
  }

  void toggleItem(CartItemModel item, bool value) {
    item.selected = value;
    notifyListeners();
  }

  void updateQuantity(CartItemModel item, int newQuantity) {
    if (newQuantity < 1) return;
    item.quantity = newQuantity;
    notifyListeners();
  }

  void toggleSelectAll(bool value) {
    for (final item in _items) {
      item.selected = value;
    }
    notifyListeners();
  }

  void clearCheckedOutItems() {
    _items.removeWhere((item) => item.selected);
    notifyListeners();
  }

  void removeSelectedItems() {
    _items.removeWhere((item) => item.selected);
    notifyListeners();
  }
}
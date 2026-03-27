import 'package:flutter/material.dart';
import '../models/order_history_model.dart';

class OrderHistoryViewModel extends ChangeNotifier {
  final List<OrderHistoryModel> _orders = [];

  List<OrderHistoryModel> get orders => List.unmodifiable(_orders);

  bool get isEmpty => _orders.isEmpty;

  void addOrder(OrderHistoryModel order) {
    _orders.insert(0, order);
    notifyListeners();
  }

  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }
}
class OrderHistoryModel {
  final String orderId;
  final String orderDate;
  final String productName;
  final String productImage;
  final int quantity;
  final int totalPrice;
  final String paymentMethod;
  final String shippingMethod;
  final String address;
  final String statusOrder;
  final List<OrderTrackingModel> tracking;

  const OrderHistoryModel({
    required this.orderId,
    required this.orderDate,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.totalPrice,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.address,
    required this.statusOrder,
    required this.tracking,
  });
}

class OrderTrackingModel {
  final String title;
  final String time;
  final bool isDone;

  const OrderTrackingModel({
    required this.title,
    required this.time,
    required this.isDone,
  });
}
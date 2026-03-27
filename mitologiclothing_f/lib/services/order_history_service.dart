import '../models/order_history_model.dart';

class OrderHistoryService {
  static List<OrderHistoryModel> getOrders() {
    return const [
      OrderHistoryModel(
        orderId: 'ORD-250326-001',
        orderDate: '26 Maret 2026, 20:15',
        productName: 'Cotton Combed',
        productImage: 'assets/images/products/kaos1.jpeg',
        quantity: 2,
        totalPrice: 298000,
        paymentMethod: 'Transfer BCA',
        shippingMethod: 'JNE Regular',
        address: 'Jl. Contoh Alamat No. 10',
        statusOrder: 'Sedang Dikirim',
        tracking: [
          OrderTrackingModel(
            title: 'Pesanan dibuat',
            time: '26 Maret 2026, 20:15',
            isDone: true,
          ),
          OrderTrackingModel(
            title: 'Pembayaran dikonfirmasi',
            time: '26 Maret 2026, 20:40',
            isDone: true,
          ),
          OrderTrackingModel(
            title: 'Pesanan diproses',
            time: '27 Maret 2026, 09:10',
            isDone: true,
          ),
          OrderTrackingModel(
            title: 'Pesanan dikirim',
            time: '27 Maret 2026, 15:20',
            isDone: true,
          ),
          OrderTrackingModel(
            title: 'Pesanan diterima',
            time: '-',
            isDone: false,
          ),
        ],
      ),
    ];
  }
}
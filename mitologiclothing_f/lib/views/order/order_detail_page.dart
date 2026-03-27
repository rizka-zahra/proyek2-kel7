import 'package:flutter/material.dart';
import '../../models/order_history_model.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderHistoryModel order;

  const OrderDetailPage({
    super.key,
    required this.order,
  });

  String _formatRupiah(int value) {
    final text = value.toString();
    final buffer = StringBuffer();
    int counter = 0;

    for (int i = text.length - 1; i >= 0; i--) {
      buffer.write(text[i]);
      counter++;
      if (counter % 3 == 0 && i != 0) {
        buffer.write('.');
      }
    }

    return 'Rp ${buffer.toString().split('').reversed.join()}';
  }

  Color _statusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'menunggu konfirmasi':
        return const Color(0xFFFFF4E5);
      case 'diproses':
        return const Color(0xFFEAF3FF);
      case 'sedang dikirim':
        return const Color(0xFFEAF3FF);
      case 'selesai':
        return const Color(0xFFEAF8EE);
      case 'dibatalkan':
        return const Color(0xFFFFEBEE);
      default:
        return const Color(0xFFF1F3F7);
    }
  }

  Color _statusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'menunggu konfirmasi':
        return const Color(0xFFE39B17);
      case 'diproses':
        return const Color(0xFF3563FF);
      case 'sedang dikirim':
        return const Color(0xFF3563FF);
      case 'selesai':
        return const Color(0xFF1E8E3E);
      case 'dibatalkan':
        return const Color(0xFFD93025);
      default:
        return const Color(0xFF6D7485);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(
            color: Color(0xFF253047),
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF253047)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _sectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ringkasan Pesanan',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF253047),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _infoRow('ID Pesanan', order.orderId),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _statusBgColor(order.statusOrder),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        order.statusOrder,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _statusTextColor(order.statusOrder),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _infoRow('Tanggal', order.orderDate),
                _infoRow('Metode Pembayaran', order.paymentMethod),
                _infoRow('Pengiriman', order.shippingMethod),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _sectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Produk',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF253047),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        order.productImage,
                        width: 84,
                        height: 84,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Container(
                            width: 84,
                            height: 84,
                            color: const Color(0xFFF1F2F6),
                            child: const Icon(Icons.image_outlined),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.productName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF253047),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${order.quantity} pcs',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6D7485),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _formatRupiah(order.totalPrice),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF11131A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _sectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alamat Pengiriman',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF253047),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  order.address,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Color(0xFF50586B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _sectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status Pengiriman',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF253047),
                  ),
                ),
                const SizedBox(height: 16),
                ...List.generate(
                  order.tracking.length,
                  (index) => _trackingItem(
                    step: order.tracking[index],
                    isLast: index == order.tracking.length - 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _sectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ringkasan Pembayaran',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF253047),
                  ),
                ),
                const SizedBox(height: 14),
                _paymentRow('Jumlah Produk', '${order.quantity} pcs'),
                const SizedBox(height: 10),
                _paymentRow('Total Pembayaran', _formatRupiah(order.totalPrice),
                    isBold: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E5EC)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF8C8F9A),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF253047),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _trackingItem({
    required OrderTrackingModel step,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              step.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
              size: 20,
              color: step.isDone
                  ? const Color(0xFF3563FF)
                  : const Color(0xFFB6BBC8),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 38,
                color: const Color(0xFFE2E5EC),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        step.isDone ? FontWeight.w700 : FontWeight.w500,
                    color: const Color(0xFF253047),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  step.time,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8C8F9A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _paymentRow(String label, String value, {bool isBold = false}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: isBold ? 15 : 14,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
              color: const Color(0xFF253047),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 15 : 14,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
            color: const Color(0xFF11131A),
          ),
        ),
      ],
    );
  }
}
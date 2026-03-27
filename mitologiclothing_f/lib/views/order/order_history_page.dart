import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order_history_model.dart';
import '../../viewmodels/order_history_viewmodel.dart';
import 'order_detail_page.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderHistoryViewModel>().orders;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        title: const Text(
          'Riwayat Pesanan',
          style: TextStyle(
            color: Color(0xFF253047),
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF253047)),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                'Belum ada riwayat pesanan',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF707788),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final OrderHistoryModel order = orders[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderDetailPage(order: order),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFE2E5EC)),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            order.productImage,
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                width: 72,
                                height: 72,
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
                              const SizedBox(height: 6),
                              Text(
                                order.orderDate,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF8C8F9A),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${order.quantity} pcs • ${_formatRupiah(order.totalPrice)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF50586B),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4FF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  order.statusOrder,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF3563FF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Color(0xFFB0B4C0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
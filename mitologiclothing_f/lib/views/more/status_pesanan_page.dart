import 'package:flutter/material.dart';
import '../../models/cart_item_model.dart';
import '../../utils/app_format.dart';
import 'pesanan_page.dart';

class StatusPesananPage extends StatelessWidget {
  final List<CartItemModel> cartItems;
  final String phone;
  final String address;
  final String shippingMethod;
  final String paymentMethod;
  final int shippingCost;

  const StatusPesananPage({
    super.key,
    required this.cartItems,
    required this.phone,
    required this.address,
    required this.shippingMethod,
    required this.paymentMethod,
    required this.shippingCost,
  });

  int get productSubtotal {
    return cartItems.fold(0, (sum, item) => sum + item.subtotal);
  }

  int get totalPayment => productSubtotal + shippingCost;

  @override
  Widget build(BuildContext context) {
    final item = cartItems.first;
    final String orderId = 'ORD1773156693562';
    final String orderDate = AppFormat.tanggalWaktuIndo(DateTime.now());

    final bool isNetworkImage =
        item.product.imageUrl.startsWith('http://') ||
        item.product.imageUrl.startsWith('https://');

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        title: const Text(
          'Proses Pemesanan',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF22242A),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF22242A)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFD8DCE5)),
            ),
            child: Column(
              children: [
                Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F7),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFD7D9E1)),
                  ),
                  child: const Icon(
                    Icons.inventory_2_outlined,
                    color: Color(0xFF9EA3B4),
                    size: 34,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF11131A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Pesanan Dikonfirmasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'ID Pesanan: $orderId',
                  style: const TextStyle(
                    color: Color(0xFF8D91A1),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  orderDate,
                  style: const TextStyle(
                    color: Color(0xFF8D91A1),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('INFORMASI PENERIMA'),
          _whiteCard(
            child: Column(
              children: [
                _infoRow(Icons.phone_outlined, 'NO. TELEPON', phone),
                const SizedBox(height: 14),
                _infoRow(Icons.location_on_outlined, 'ALAMAT PENGIRIMAN', address),
                const SizedBox(height: 14),
                _infoRow(Icons.local_shipping_outlined, 'KURIR PENGIRIMAN', shippingMethod),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('RINCIAN PRODUK'),
          _whiteCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 82,
                    height: 82,
                    child: isNetworkImage
                        ? Image.network(item.product.imageUrl, fit: BoxFit.cover)
                        : Image.asset(
                            item.product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFF1F2F6),
                                child: const Icon(Icons.image_outlined),
                              );
                            },
                          ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 8,
                        children: [
                          _badge('UKURAN', item.size),
                          _badge('WARNA', item.color.toUpperCase()),
                          _badge('BAHAN', item.material.toUpperCase()),
                          _badge('JUMLAH', '${item.quantity}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('INFORMASI PENGIRIMAN'),
          _whiteCard(
            child: Column(
              children: [
                _infoField(Icons.phone_outlined, 'NO. TELEPON', phone),
                const SizedBox(height: 14),
                _infoField(Icons.location_on_outlined, 'ALAMAT PENGIRIMAN', address),
                const SizedBox(height: 14),
                _infoField(Icons.local_shipping_outlined, 'KURIR PENGIRIMAN', shippingMethod),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('RINCIAN PEMBAYARAN'),
          _whiteCard(
            child: Column(
              children: [
                _paymentRow('Subtotal Produk', AppFormat.rupiah(productSubtotal)),
                const SizedBox(height: 12),
                _paymentRow('Subtotal Pengiriman', AppFormat.rupiah(shippingCost)),
                const SizedBox(height: 14),
                const Divider(color: Color(0xFFE0E3EB)),
                const SizedBox(height: 12),
                _paymentRow(
                  'Total Pembayaran',
                  AppFormat.rupiah(totalPayment),
                  isBold: true,
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'METODE PEMBAYARAN',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9A9EAB),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        paymentMethod,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fitur hubungi penjual masih dummy'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF11131A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'HUBUNGI PENJUAL',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 54,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PesananPage(initialIndex: 4),
                  ),
                  (route) => route.isFirst,
                );
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: const BorderSide(color: Color(0xFFD5D8E2)),
              ),
              child: const Text(
                'KEMBALI KE KERANJANG',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: Color(0xFF22242A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          letterSpacing: 1.4,
          color: Color(0xFF8D90A0),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _whiteCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFD8DCE5)),
      ),
      child: child,
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF9CA1B0)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9A9EAB),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2C2D33),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _badge(String label, String value) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF9A9EAB),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF3A3A42),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoField(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF9CA1B0)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9A9EAB),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
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
              fontSize: isBold ? 16 : 15,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
              color: const Color(0xFF2C2D33),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 16 : 15,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
            color: const Color(0xFF2C2D33),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../../models/cart_item_model.dart';
import '../../utils/app_format.dart';
import 'status_pesanan_page.dart';

class ProsesPemesananPage extends StatefulWidget {
  final List<CartItemModel> cartItems;

  const ProsesPemesananPage({
    super.key,
    required this.cartItems,
  });

  @override
  State<ProsesPemesananPage> createState() => _ProsesPemesananPageState();
}

class _ProsesPemesananPageState extends State<ProsesPemesananPage> {
  final TextEditingController _phoneController =
      TextEditingController(text: '08876567345');

  final TextEditingController _addressController =
      TextEditingController(text: 'www');

  final List<Map<String, dynamic>> _shippingOptions = const [
    {
      'name': 'JNE Regular',
      'cost': 15000,
    },
    {
      'name': 'J&T Express',
      'cost': 18000,
    },
    {
      'name': 'SiCepat Regular',
      'cost': 17000,
    },
    {
      'name': 'AnterAja Regular',
      'cost': 16000,
    },
  ];

  final List<String> _paymentMethods = const [
    'Transfer BCA',
    'Transfer BRI',
    'Transfer Mandiri',
    'Transfer BNI',
    'COD',
    'DANA',
    'OVO',
    'GoPay',
  ];

  String _shippingMethod = 'JNE Regular';
  int _shippingCost = 15000;

  String _paymentMethod = 'Transfer BCA';

  int get _productSubtotal {
    return widget.cartItems.fold(0, (sum, item) => sum + item.subtotal);
  }

  int get _totalPayment => _productSubtotal + _shippingCost;

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _showPaymentMethodSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22242A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _paymentMethods.length,
                      itemBuilder: (context, index) {
                        final method = _paymentMethods[index];
                        final bool isSelected = method == _paymentMethod;

                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            setState(() {
                              _paymentMethod = method;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFF1F4FB)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF304A83)
                                    : const Color(0xFFD8DCE5),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: Color(0xFF8C8F9A),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    method,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                      color: const Color(0xFF22242A),
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF304A83),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showShippingMethodSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih Opsi Pengiriman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22242A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _shippingOptions.length,
                      itemBuilder: (context, index) {
                        final option = _shippingOptions[index];
                        final String name = option['name'] as String;
                        final int cost = option['cost'] as int;
                        final bool isSelected = name == _shippingMethod;

                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            setState(() {
                              _shippingMethod = name;
                              _shippingCost = cost;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFF1F4FB)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF304A83)
                                    : const Color(0xFFD8DCE5),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.local_shipping_outlined,
                                  color: Color(0xFF8C8F9A),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                          color: const Color(0xFF22242A),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        AppFormat.rupiah(cost),
                                        style: const TextStyle(
                                          color: Color(0xFF8C8F9A),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF304A83),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _submitOrder() {
    final phone = _phoneController.text.trim();
    final address = _addressController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nomor telepon wajib diisi'),
        ),
      );
      return;
    }

    if (address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Alamat wajib diisi'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StatusPesananPage(
          cartItems: widget.cartItems,
          phone: phone,
          address: address,
          shippingMethod: _shippingMethod,
          paymentMethod: _paymentMethod,
          shippingCost: _shippingCost,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.cartItems.first;
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
          _sectionTitle('INFORMASI PENERIMA'),
          _card(
            child: Column(
              children: [
                _fieldLabel('NO. TELEPHONE'),
                _textField(_phoneController, hint: '08xxxxxxxxxx'),
                const SizedBox(height: 14),
                _fieldLabel('ALAMAT PENGGUNA'),
                TextField(
                  controller: _addressController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Masukkan alamat lengkap',
                    filled: true,
                    fillColor: const Color(0xFFF7F7FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE2E4EC)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE2E4EC)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('RINCIAN PESANAN'),
          _card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 82,
                    height: 82,
                    child: isNetworkImage
                        ? Image.network(
                            item.product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFF1F2F6),
                                child: const Icon(Icons.image_outlined),
                              );
                            },
                          )
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
                          _specChip('UKURAN', item.size),
                          _specChip('WARNA', item.color.toUpperCase()),
                          _specChip('BAHAN', item.material.toUpperCase()),
                          _specChip('JUMLAH', '${item.quantity}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('OPSI PENGIRIMAN'),
          _selectCard(
            title: _shippingMethod,
            subtitle: AppFormat.rupiah(_shippingCost),
            icon: Icons.local_shipping_outlined,
            onTap: _showShippingMethodSheet,
          ),
          const SizedBox(height: 18),
          _sectionTitle('METODE PEMBAYARAN'),
          _selectCard(
            title: _paymentMethod,
            subtitle: 'Tap untuk memilih metode pembayaran',
            icon: Icons.credit_card_outlined,
            onTap: _showPaymentMethodSheet,
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF11131A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RINGKASAN PEMBAYARAN',
                  style: TextStyle(
                    color: Color(0xFFC1C5D3),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 14),
                _summaryRow(
                  'Subtotal Produk',
                  AppFormat.rupiah(_productSubtotal),
                  color: Colors.white70,
                ),
                const SizedBox(height: 10),
                _summaryRow(
                  'Subtotal Pengiriman',
                  AppFormat.rupiah(_shippingCost),
                  color: Colors.white70,
                ),
                const SizedBox(height: 14),
                const Divider(color: Colors.white24),
                const SizedBox(height: 10),
                _summaryRow(
                  'TOTAL PEMBAYARAN',
                  AppFormat.rupiah(_totalPayment),
                  color: Colors.white,
                  isBold: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: _submitOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF11131A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'KONFIRMASI PESANAN',
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
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: const BorderSide(color: Color(0xFFD5D8E2)),
              ),
              child: const Text(
                'BATALKAN',
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

  Widget _card({required Widget child}) {
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

  Widget _fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF9A9EAB),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _textField(TextEditingController controller, {required String hint}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF7F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E4EC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E4EC)),
        ),
      ),
    );
  }

  Widget _specChip(String label, String value) {
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

  Widget _selectCard({
    required String title,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFD8DCE5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF989DAC), size: 28),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF8C8F9A),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFC0C3CE)),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    required Color color,
    bool isBold = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: isBold ? 16 : 15,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: isBold ? 16 : 15,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
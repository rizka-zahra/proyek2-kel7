import 'package:flutter/material.dart';
import '../../models/cart_item_model.dart';
import '../../services/shop_dummy_service.dart';
import '../../utils/app_format.dart';
import '../../widgets/brand_header.dart';
import 'proses_pemesanan_page.dart';

class KeranjangTab extends StatefulWidget {
  const KeranjangTab({super.key});

  @override
  State<KeranjangTab> createState() => _KeranjangTabState();
}

class _KeranjangTabState extends State<KeranjangTab> {
  late List<CartItemModel> _items;
  bool _selectAll = true;

  @override
  void initState() {
    super.initState();
    _items = ShopDummyService.getCartItems();
  }

  int get _total {
    return _items
        .where((item) => item.selected)
        .fold(0, (sum, item) => sum + item.subtotal);
  }

  List<CartItemModel> get _selectedItems {
    return _items.where((item) => item.selected).toList();
  }

  void _toggleSelectAll(bool value) {
    setState(() {
      _selectAll = value;
      for (final item in _items) {
        item.selected = value;
      }
    });
  }

  void _updateSelectAll() {
    _selectAll = _items.isNotEmpty && _items.every((item) => item.selected);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BrandHeader(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    children: [
                      const Text(
                        'Keranjang',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF253047),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFFDADCE4)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _selectAll,
                              onChanged: (value) {
                                _toggleSelectAll(value ?? false);
                              },
                            ),
                            const Text(
                              'Pilih Semua',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _items.removeWhere((item) => item.selected);
                                  _updateSelectAll();
                                });
                              },
                              child: const Text(
                                'Hapus',
                                style: TextStyle(
                                  color: Color(0xFFC1C1C8),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      ..._items.map((item) => _buildCartCard(item)).toList(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFE2E5EC)),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Total (${_selectedItems.length} produk)',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6D6D76),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            AppFormat.rupiah(_total),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _selectedItems.isEmpty
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProsesPemesananPage(
                                        cartItems: _selectedItems,
                                      ),
                                    ),
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF11131A),
                            disabledBackgroundColor: const Color(0xFFC8C8CC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'CHECKOUT',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartCard(CartItemModel item) {
    final bool isNetworkImage =
        item.product.imageUrl.startsWith('http://') ||
        item.product.imageUrl.startsWith('https://');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFDADCE4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: item.selected,
            onChanged: (value) {
              setState(() {
                item.selected = value ?? false;
                _updateSelectAll();
              });
            },
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 80,
              height: 80,
              child: isNetworkImage
                  ? Image.network(
                      item.product.imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      item.product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFF2F3F7),
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
                const SizedBox(height: 6),
                Text(
                  AppFormat.rupiah(item.product.price),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8C8C95),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 112,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFD6D8E1)),
                  ),
                  child: Row(
                    children: [
                      _qtyButton(
                        icon: Icons.remove,
                        onTap: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            }
                          });
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '${item.quantity}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      _qtyButton(
                        icon: Icons.add,
                        onTap: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _items.remove(item);
                _updateSelectAll();
              });
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Color(0xFFC5C5CB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 34,
        child: Icon(
          icon,
          size: 18,
          color: const Color(0xFF8A8A95),
        ),
      ),
    );
  }
}
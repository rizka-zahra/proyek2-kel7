import 'package:flutter/material.dart';
import '../../models/shop_item_model.dart';
import '../../services/shop_dummy_service.dart';
import '../../widgets/brand_header.dart';

class PricelistTab extends StatefulWidget {
  const PricelistTab({super.key});

  @override
  State<PricelistTab> createState() => _PricelistTabState();
}

class _PricelistTabState extends State<PricelistTab> {
  final List<ShopItemModel> _allItems = ShopDummyService.getProducts();
  String _query = '';

  List<ShopItemModel> get _filteredItems {
    if (_query.isEmpty) return _allItems;

    final keyword = _query.toLowerCase();

    return _allItems.where((item) {
      return item.name.toLowerCase().contains(keyword);
    }).toList();
  }

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
    return SafeArea(
      child: Column(
        children: [
          const BrandHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pricelist',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF253047),
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari Produk',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color(0xFFD9D9E2)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color(0xFFD9D9E2)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color(0xFF304A83)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: _filteredItems.isEmpty
                        ? const Center(
                            child: Text(
                              'Data pricelist belum tersedia',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF6D6D76),
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemCount: _filteredItems.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final item = _filteredItems[index];
                              return _buildPriceItem(item);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceItem(ShopItemModel item) {
    final bool isNetworkImage =
        item.imageUrl.startsWith('http://') ||
        item.imageUrl.startsWith('https://');

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE0E3EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 84,
              height: 84,
              child: isNetworkImage
                  ? Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: const Color(0xFFF2F3F7),
                          child: const Icon(Icons.image_outlined),
                        );
                      },
                    )
                  : Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
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
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF253047),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Harga per 1 pcs',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF7B8190),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: Color(0xFF5F6675),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            _formatRupiah(item.price),
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF11131A),
            ),
          ),
        ],
      ),
    );
  }
}
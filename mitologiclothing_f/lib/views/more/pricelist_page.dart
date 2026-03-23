import 'package:flutter/material.dart';
import '../../models/shop_item_model.dart';
import '../../services/shop_dummy_service.dart';
import '../../widgets/brand_header.dart';
import '../../widgets/shop_item_card.dart';

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

    return _allItems
        .where((item) => item.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
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
                      hintText: 'Cari Pricelist',
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
                    ),
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: GridView.builder(
                      itemCount: _filteredItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.67,
                      ),
                      itemBuilder: (context, index) {
                        return ShopItemCard(
                          item: _filteredItems[index],
                          showPrice: true,
                        );
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
}
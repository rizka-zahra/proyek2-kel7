import 'package:flutter/material.dart';
import '../../models/color_catalog_model.dart';
import '../../services/shop_dummy_service.dart';
import '../../widgets/brand_header.dart';

class KatalogWarnaTab extends StatelessWidget {
  const KatalogWarnaTab({super.key});

  Color _hexToColor(String hexCode) {
    final hex = hexCode.replaceAll('#', '');
    final value = int.parse('FF$hex', radix: 16);
    return Color(value);
  }

  @override
  Widget build(BuildContext context) {
    final List<ColorCatalogModel> colors = ShopDummyService.getColors();

    return SafeArea(
      child: Column(
        children: [
          const BrandHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F2F6),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFDADCE4)),
                        ),
                        child: const Icon(
                          Icons.palette_outlined,
                          color: Color(0xFF8C96B3),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Katalog Warna',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF253047),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Pilihan warna kain yang tersedia',
                              style: TextStyle(
                                color: Color(0xFF8A94B0),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: colors.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.86,
                      ),
                      itemBuilder: (context, index) {
                        final item = colors[index];

                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 78,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: _hexToColor(item.hexCode),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0xFFD8DCE6),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF33425C),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item.hexCode,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF98A2B9),
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
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
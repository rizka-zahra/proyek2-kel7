import 'package:flutter/material.dart';
import '../models/shop_item_model.dart';
import '../utils/app_format.dart';

class ShopItemCard extends StatelessWidget {
  final ShopItemModel item;
  final bool showPrice;
  final bool showStock;
  final bool showCartAction;
  final VoidCallback? onCartTap;

  const ShopItemCard({
    super.key,
    required this.item,
    this.showPrice = false,
    this.showStock = false,
    this.showCartAction = false,
    this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImage =
        item.imageUrl.startsWith('http://') ||
        item.imageUrl.startsWith('https://');

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: isNetworkImage
                      ? Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const _ImageFallback();
                          },
                        )
                      : Image.asset(
                          item.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const _ImageFallback();
                          },
                        ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.category,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showStock)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Stok: ${item.stock}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8F8F98),
                        ),
                      ),
                    ),
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF2A2A2A),
                    ),
                  ),
                  const Spacer(),
                  if (showPrice)
                    Text(
                      AppFormat.rupiah(item.price),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Color(0xFF2A2A2A),
                      ),
                    ),
                  if (showCartAction)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: onCartTap,
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xFF6B6B76),
                        ),
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

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F3F7),
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          size: 42,
          color: Colors.grey,
        ),
      ),
    );
  }
}
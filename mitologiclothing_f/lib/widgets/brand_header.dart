import 'package:flutter/material.dart';

class BrandHeader extends StatelessWidget {
  final IconData actionIcon;

  const BrandHeader({
    super.key,
    this.actionIcon = Icons.person_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 34,
                height: 34,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.storefront_outlined,
                    size: 30,
                    color: Color(0xFF415392),
                  );
                },
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'MITODOLOGI CLOTHING',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF6E6E6E),
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              Icon(
                actionIcon,
                color: const Color(0xFF8A8FA3),
                size: 28,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            height: 1,
            color: const Color(0xFF415392),
          ),
        ],
      ),
    );
  }
}
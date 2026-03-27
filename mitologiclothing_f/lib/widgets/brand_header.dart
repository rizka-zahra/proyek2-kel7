import 'package:flutter/material.dart';
import '../services/access_service.dart';
import '../models/user_access_model.dart';
import 'profile_quick_menu.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  Future<void> _openProfile(BuildContext context) async {
    final UserAccessModel? user = await AccessService.getUser();

    if (!context.mounted) return;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data pengguna belum tersedia'),
        ),
      );
      return;
    }

    await showProfileQuickMenu(context, user);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 42,
            width: 42,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.storefront_outlined,
                size: 38,
                color: Color(0xFF5C6F97),
              );
            },
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'MITODOLOGI CLOTHING',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _openProfile(context),
            icon: const Icon(
              Icons.person_outline,
              color: Color(0xFF8B90A4),
            ),
          ),
        ],
      ),
    );
  }
}
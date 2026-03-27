import 'package:flutter/material.dart';
import '../models/user_access_model.dart';
import '../views/order/order_history_page.dart';

Future<void> showProfileQuickMenu(
  BuildContext context,
  UserAccessModel user,
) async {
  await showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.18),
    builder: (dialogContext) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.only(
          top: 36,
          right: 20,
          left: 40,
          bottom: 0,
        ),
        alignment: Alignment.topRight,
        child: Container(
          width: 300,
          padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x16000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoText(user.name),
              const SizedBox(height: 4),
              _infoText(user.phone),
              const SizedBox(height: 4),
              _infoText(user.userDescription),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  Navigator.pop(dialogContext);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderHistoryPage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Riwayat pesanan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3563FF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _infoText(String value) {
  return Text(
    value.trim().isEmpty ? '-' : value,
    style: const TextStyle(
      fontSize: 15,
      height: 1.35,
      fontWeight: FontWeight.w500,
      color: Color(0xFF1F2430),
    ),
  );
}
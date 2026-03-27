import 'package:flutter/material.dart';
import '../../models/user_access_model.dart';

class ProfileInfoPage extends StatelessWidget {
  final UserAccessModel user;

  const ProfileInfoPage({
    super.key,
    required this.user,
  });

  InputDecoration _decoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color(0xFFF5F6FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD8DCE5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD8DCE5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        title: const Text(
          'Informasi Pengguna',
          style: TextStyle(
            color: Color(0xFF253047),
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF253047)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: TextEditingController(text: user.name),
            readOnly: true,
            decoration: _decoration('Nama'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: TextEditingController(text: user.phone),
            readOnly: true,
            decoration: _decoration('Nomor Telepon'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: TextEditingController(text: user.userDescription),
            readOnly: true,
            decoration: _decoration('Keterangan Pengguna'),
          ),
        ],
      ),
    );
  }
}
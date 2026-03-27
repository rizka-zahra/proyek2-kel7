import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/user_access_model.dart';
import '../../services/access_service.dart';

class AccessRequestPage extends StatefulWidget {
  const AccessRequestPage({super.key});

  @override
  State<AccessRequestPage> createState() => _AccessRequestPageState();
}

class _AccessRequestPageState extends State<AccessRequestPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isSubmitting = false;

  Future<void> _submitAndOpenWhatsApp() async {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama dan nomor telepon wajib diisi'),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final user = UserAccessModel(
      name: name,
      phone: phone,
      userDescription: 'Pengguna Belanja',
    );

    await AccessService.saveUser(user);

    const adminPhone = '6281220542581'; // nomor admin
    final message = Uri.encodeComponent(
      'Halo admin, saya ingin mengakses fitur belanja.\n'
      'Nama: $name\n'
      'No. Telepon: $phone\n'
      'Keterangan: Pengguna Belanja',
    );

    final uri = Uri.parse('https://wa.me/$adminPhone?text=$message');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }

    if (!mounted) return;

    setState(() {
      _isSubmitting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data tersimpan. Silakan lanjut chat admin di WhatsApp.'),
      ),
    );

    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD8DCE5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD8DCE5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF304A83)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        title: const Text(
          'Login Akses Belanja',
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
          const Text(
            'Silakan isi data terlebih dahulu untuk mengakses fitur belanja.',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF5E6472),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: _inputDecoration('Nama lengkap'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: _inputDecoration('Nomor telepon'),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : _submitAndOpenWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF11131A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                _isSubmitting ? 'Memproses...' : 'LANJUT KE WHATSAPP ADMIN',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
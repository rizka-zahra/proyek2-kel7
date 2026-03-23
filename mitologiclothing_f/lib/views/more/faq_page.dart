import 'package:flutter/material.dart';
import '../../widgets/menu_drawer.dart';
import '../../widgets/navbar_home.dart';
import '../home/home_page.dart';
import 'about_page.dart';
import 'product_info_page.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<_FaqSection> _sections = [
    _FaqSection(
      title: 'Pemesanan',
      items: [
        _FaqItem(
          question: 'Berapa minimum order di konveksi?',
          answer:
              'Minimum order biasanya menyesuaikan jenis produk. Untuk kaos, polo, kemeja, jaket, atau seragam, jumlah minimal umumnya mulai dari 12 pcs. Namun, jumlah ini bisa berbeda tergantung model, bahan, dan teknik produksi yang dipakai.',
        ),
        _FaqItem(
          question: 'Apakah saya bisa pesan dengan desain custom?',
          answer:
              'Bisa. Anda dapat memesan produk dengan desain custom sesuai kebutuhan. Desain bisa berupa logo, tulisan, kombinasi warna, ukuran, posisi sablon, atau bordir. Jika belum punya desain final, tim konveksi biasanya membantu menyesuaikan konsep yang Anda inginkan.',
        ),
        _FaqItem(
          question: 'Apakah bisa dibuatkan desain terlebih dahulu?',
          answer:
              'Bisa. Biasanya tim akan membuat preview atau mockup terlebih dahulu sebelum produksi dimulai. Preview ini penting agar warna, posisi logo, ukuran desain, dan detail produk sudah sesuai dengan persetujuan pelanggan.',
        ),
        _FaqItem(
          question: 'Bahan apa saja yang tersedia?',
          answer:
              'Pilihan bahan tergantung jenis produk yang dipesan. Untuk kaos, bahan yang umum dipakai adalah cotton combed, carded, dan dri-fit. Untuk kemeja atau seragam, biasanya tersedia bahan seperti oxford, tropical, atau american drill. Tim konveksi akan membantu merekomendasikan bahan sesuai fungsi dan budget.',
        ),
      ],
    ),
    _FaqSection(
      title: 'Produksi & Pengiriman',
      items: [
        _FaqItem(
          question: 'Berapa lama proses produksi?',
          answer:
              'Waktu produksi bergantung pada jumlah pesanan, tingkat kesulitan desain, ketersediaan bahan, dan antrean produksi. Secara umum, produksi memerlukan sekitar 7 sampai 21 hari kerja setelah desain disetujui dan pembayaran uang muka diterima.',
        ),
        _FaqItem(
          question: 'Apakah harus bayar DP terlebih dahulu?',
          answer:
              'Ya, pada umumnya pemesanan dimulai dengan pembayaran DP atau uang muka. DP berfungsi untuk mengunci jadwal produksi, pembelian bahan, dan proses desain. Sisa pembayaran biasanya dilunasi sebelum atau saat barang dikirim, sesuai kesepakatan awal.',
        ),
        _FaqItem(
          question: 'Apakah pesanan bisa dikirim ke luar kota?',
          answer:
              'Bisa. Pesanan dapat dikirim ke berbagai kota melalui jasa ekspedisi. Biaya kirim biasanya menyesuaikan alamat tujuan, berat barang, dan layanan ekspedisi yang dipilih. Setelah barang dikirim, nomor resi akan diberikan kepada pelanggan.',
        ),
        _FaqItem(
          question: 'Apakah ukuran bisa mix dalam satu pesanan?',
          answer:
              'Bisa. Dalam satu pesanan, ukuran biasanya dapat dicampur, misalnya S, M, L, XL, dan seterusnya. Sebelum produksi, pelanggan perlu mengirimkan rincian jumlah tiap ukuran agar tidak terjadi kesalahan saat proses pengerjaan.',
        ),
      ],
    ),
  ];

  final Map<String, bool> _expandedMap = {
    'p0': false,
    'p1': false,
    'p2': false,
    'p3': true,
    'p4': false,
    'p5': false,
    'p6': false,
    'p7': true,
  };

  void _handleBottomNav(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(initialIndex: index),
      ),
    );
  }

  void _openPage(Widget page) {
    Navigator.pop(context);
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    });
  }

  void _handleDrawerNavigation(String menu) {
    switch (menu) {
      case 'beranda':
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 0),
          ),
        );
        break;

      case 'belanja':
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 2),
          ),
        );
        break;

      case 'artikel':
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(initialIndex: 3),
          ),
        );
        break;

      case 'tentang_kami':
        _openPage(const AboutPage());
        break;

      case 'informasi_produk':
        _openPage(const ProductInfoPage());
        break;

      case 'faq':
        Navigator.pop(context);
        break;
    }
  }

  void _toggleItem(String key) {
    setState(() {
      _expandedMap[key] = !(_expandedMap[key] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    int runningIndex = 0;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF8F7FB),
      endDrawer: MenuDrawer(
        onItemTap: _handleDrawerNavigation,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 72,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 42,
              width: 42,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'MITODOLOGI CLOTHING',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF5C6F97),
              size: 30,
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF304A83),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 26, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 28),
            ..._sections.map((section) {
              final sectionWidgets = <Widget>[
                Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5B5B5B),
                  ),
                ),
                const SizedBox(height: 12),
              ];

              for (final item in section.items) {
                final key = 'p$runningIndex';
                sectionWidgets.add(
                  _buildFaqTile(
                    question: item.question,
                    answer: item.answer,
                    isExpanded: _expandedMap[key] ?? false,
                    onTap: () => _toggleItem(key),
                  ),
                );
                runningIndex++;
              }

              sectionWidgets.add(const SizedBox(height: 22));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sectionWidgets,
              );
            }).toList(),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(
        currentIndex: _currentIndex,
        onTap: _handleBottomNav,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FB),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFD9E1EE),
            ),
          ),
          child: const Icon(
            Icons.live_help_outlined,
            color: Color(0xFF8EA1BF),
            size: 28,
          ),
        ),
        const SizedBox(width: 14),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2A44),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Pertanyaan yang sering diajukan',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9BA9C3),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFaqTile({
    required String question,
    required String answer,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF444444),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 28,
                  color: const Color(0xFF666666),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF7A7A7A),
              ),
            ),
          ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFF666666),
        ),
      ],
    );
  }
}

class _FaqSection {
  final String title;
  final List<_FaqItem> items;

  _FaqSection({
    required this.title,
    required this.items,
  });
}

class _FaqItem {
  final String question;
  final String answer;

  _FaqItem({
    required this.question,
    required this.answer,
  });
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item_model.dart';
import '../../models/order_history_model.dart';
import '../../utils/app_format.dart';
import '../../viewmodels/order_history_viewmodel.dart';
import 'status_pesanan_page.dart';

class ProsesPemesananPage extends StatefulWidget {
  final List<CartItemModel> cartItems;

  const ProsesPemesananPage({
    super.key,
    required this.cartItems,
  });

  @override
  State<ProsesPemesananPage> createState() => _ProsesPemesananPageState();
}

class _ProsesPemesananPageState extends State<ProsesPemesananPage> {
  final TextEditingController _recipientNameController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _detailAddressController =
      TextEditingController();
  final TextEditingController _addressNoteController = TextEditingController();

  final List<Map<String, dynamic>> _shippingOptions = const [
    {'name': 'JNE Regular', 'cost': 15000},
    {'name': 'J&T Express', 'cost': 18000},
    {'name': 'SiCepat Regular', 'cost': 17000},
    {'name': 'AnterAja Regular', 'cost': 16000},
  ];

  final List<String> _paymentMethods = const [
    'Transfer BCA',
    'Transfer BRI',
    'Transfer Mandiri',
    'Transfer BNI',
    'COD',
    'DANA',
    'OVO',
    'GoPay',
  ];

  static const List<String> _provinceOptions = [
    'Jawa Barat',
  ];

  static const Map<String, List<String>> _cityOptions = {
    'Jawa Barat': [
      'Kota Bandung',
      'Kota Bekasi',
      'Kota Bogor',
      'Kota Cimahi',
      'Kota Cirebon',
      'Kota Depok',
      'Kota Sukabumi',
      'Kota Tasikmalaya',
      'Kota Banjar',
      'Kabupaten Bandung',
      'Kabupaten Bandung Barat',
      'Kabupaten Bekasi',
      'Kabupaten Bogor',
      'Kabupaten Ciamis',
      'Kabupaten Cianjur',
      'Kabupaten Cirebon',
      'Kabupaten Garut',
      'Kabupaten Indramayu',
      'Kabupaten Karawang',
      'Kabupaten Kuningan',
      'Kabupaten Majalengka',
      'Kabupaten Pangandaran',
      'Kabupaten Purwakarta',
      'Kabupaten Subang',
      'Kabupaten Sukabumi',
      'Kabupaten Sumedang',
      'Kabupaten Tasikmalaya',
    ],
  };

  static const Map<String, List<String>> _districtOptions = {
    'Kota Bandung': [
      'Andir',
      'Antapani',
      'Arcamanik',
      'Astana Anyar',
      'Babakan Ciparay',
      'Bandung Kidul',
      'Bandung Kulon',
      'Bandung Wetan',
      'Batununggal',
      'Bojongloa Kaler',
      'Bojongloa Kidul',
      'Buahbatu',
      'Cibeunying Kaler',
      'Cibeunying Kidul',
      'Cibiru',
      'Cicendo',
      'Cidadap',
      'Cinambo',
      'Coblong',
      'Gedebage',
      'Kiaracondong',
      'Lengkong',
      'Mandalajati',
      'Panyileukan',
      'Rancasari',
      'Regol',
      'Sukajadi',
      'Sukasari',
      'Sumur Bandung',
      'Ujungberung',
    ],
    'Kota Bekasi': [
      'Bantar Gebang',
      'Bekasi Barat',
      'Bekasi Selatan',
      'Bekasi Timur',
      'Bekasi Utara',
      'Jatiasih',
      'Jatisampurna',
      'Medan Satria',
      'Mustika Jaya',
      'Pondok Gede',
      'Pondok Melati',
      'Rawalumbu',
    ],
    'Kota Bogor': [
      'Bogor Barat',
      'Bogor Selatan',
      'Bogor Tengah',
      'Bogor Timur',
      'Bogor Utara',
      'Tanah Sareal',
    ],
    'Kota Cimahi': [
      'Cimahi Selatan',
      'Cimahi Tengah',
      'Cimahi Utara',
    ],
    'Kota Cirebon': [
      'Harjamukti',
      'Kejaksan',
      'Kesambi',
      'Lemahwungkuk',
      'Pekalipan',
    ],
    'Kota Depok': [
      'Beji',
      'Bojongsari',
      'Cilodong',
      'Cimanggis',
      'Cinere',
      'Cipayung',
      'Limo',
      'Pancoran Mas',
      'Sawangan',
      'Sukmajaya',
      'Tapos',
    ],
    'Kota Sukabumi': [
      'Baros',
      'Cibeureum',
      'Citamiang',
      'Gunungpuyuh',
      'Lembursitu',
      'Warudoyong',
      'Cikole',
    ],
    'Kota Tasikmalaya': [
      'Bungursari',
      'Cibeureum',
      'Cihideung',
      'Cipedes',
      'Indihiang',
      'Kawalu',
      'Mangkubumi',
      'Purbaratu',
      'Tamansari',
      'Tawang',
    ],
    'Kota Banjar': [
      'Banjar',
      'Langensari',
      'Pataruman',
      'Purwaharja',
    ],
    'Kabupaten Bandung': [
      'Arjasari',
      'Baleendah',
      'Banjaran',
      'Bojongsoang',
      'Cangkuang',
      'Cicalengka',
      'Cikancung',
      'Cilengkrang',
      'Cileunyi',
      'Cimaung',
      'Cimenyan',
      'Ciparay',
      'Ciwidey',
      'Dayeuhkolot',
      'Ibun',
      'Katapang',
      'Kertasari',
      'Kutawaringin',
      'Majalaya',
      'Margaasih',
      'Margahayu',
      'Nagreg',
      'Pacet',
      'Pameungpeuk',
      'Pangalengan',
      'Paseh',
      'Pasirjambu',
      'Ranca Bali',
      'Rancaekek',
      'Solokanjeruk',
      'Soreang',
    ],
    'Kabupaten Bandung Barat': [
      'Batujajar',
      'Cihampelas',
      'Cikalongwetan',
      'Cililin',
      'Cipatat',
      'Cipeundeuy',
      'Cipongkor',
      'Cisarua',
      'Gununghalu',
      'Lembang',
      'Ngamprah',
      'Padalarang',
      'Parongpong',
      'Rongga',
      'Saguling',
      'Sindangkerta',
    ],
    'Kabupaten Bekasi': [
      'Babelan',
      'Bojongmangu',
      'Cabangbungin',
      'Cibarusah',
      'Cibitung',
      'Cikarang Barat',
      'Cikarang Pusat',
      'Cikarang Selatan',
      'Cikarang Timur',
      'Cikarang Utara',
      'Karangbahagia',
      'Kedungwaringin',
      'Muara Gembong',
      'Pebayuran',
      'Serang Baru',
      'Setu',
      'Sukakarya',
      'Sukatani',
      'Sukawangi',
      'Tambelang',
      'Tambun Selatan',
      'Tambun Utara',
      'Tarumajaya',
    ],
    'Kabupaten Bogor': [
      'Babakan Madang',
      'Bojonggede',
      'Caringin',
      'Cariu',
      'Ciampea',
      'Ciawi',
      'Cibinong',
      'Cibungbulang',
      'Cigombong',
      'Cigudeg',
      'Cijeruk',
      'Cileungsi',
      'Ciomas',
      'Cisarua',
      'Ciseeng',
      'Citeureup',
      'Dramaga',
      'Gunung Putri',
      'Gunung Sindur',
      'Jasinga',
      'Jonggol',
      'Kemang',
      'Klapanunggal',
      'Leuwiliang',
      'Leuwisadeng',
      'Megamendung',
      'Nanggung',
      'Pamijahan',
      'Parung',
      'Parung Panjang',
      'Ranca Bungur',
      'Sukajaya',
      'Sukamakmur',
      'Sukaraja',
      'Tajurhalang',
      'Tamansari',
      'Tenjo',
      'Tenjolaya',
    ],
    'Kabupaten Ciamis': [
      'Banjarsari',
      'Baregbeg',
      'Ciamis',
      'Cidolog',
      'Cihaurbeuti',
      'Cijeungjing',
      'Cikoneng',
      'Cimaragas',
      'Cipaku',
      'Jatinagara',
      'Kawali',
      'Lakbok',
      'Lumbung',
      'Pamarican',
      'Panjalu',
      'Panjalu',
      'Panumbangan',
      'Purwadadi',
      'Rajadesa',
      'Rancah',
      'Sadananya',
      'Sindangkasih',
      'Sukadana',
      'Tambaksari',
    ],
    'Kabupaten Cianjur': [
      'Agrabinta',
      'Bojongpicung',
      'Campaka',
      'Campaka Mulya',
      'Cianjur',
      'Cibeber',
      'Cibinong',
      'Cidaun',
      'Cijati',
      'Cikadu',
      'Cikalongkulon',
      'Cilaku',
      'Cipanas',
      'Ciranjang',
      'Gekbrong',
      'Haurwangi',
      'Kadupandak',
      'Karangtengah',
      'Leles',
      'Mande',
      'Naringgul',
      'Pacet',
      'Pagelaran',
      'Pasirkuda',
      'Sindangbarang',
      'Sukaluyu',
      'Sukanagara',
      'Sukaresmi',
      'Takokak',
      'Tanggeung',
      'Warungkondang',
    ],
    'Kabupaten Cirebon': [
      'Arjawinangun',
      'Astanajapura',
      'Babakan',
      'Beber',
      'Ciledug',
      'Ciwaringin',
      'Depok',
      'Dukupuntang',
      'Gebang',
      'Gegesik',
      'Gempol',
      'Greged',
      'Gunungjati',
      'Jamblang',
      'Kaliwedi',
      'Kapetakan',
      'Karangsembung',
      'Karangwareng',
      'Kedawung',
      'Klangenan',
      'Lemahabang',
      'Losari',
      'Mundu',
      'Pabuaran',
      'Pangenan',
      'Panguragan',
      'Pasaleman',
      'Plered',
      'Plumbon',
      'Sedong',
      'Sumber',
      'Suranenggala',
      'Susukan',
      'Talun',
      'Tengah Tani',
      'Waled',
      'Weru',
    ],
    'Kabupaten Garut': [
      'Banyuresmi',
      'Bayongbong',
      'Blubur Limbangan',
      'Bungbulang',
      'Caringin',
      'Cibalong',
      'Cibatu',
      'Cibiuk',
      'Cigedug',
      'Cihurip',
      'Cikajang',
      'Cikelet',
      'Cilawu',
      'Cisewu',
      'Cisompet',
      'Cisurupan',
      'Garut Kota',
      'Kadungora',
      'Karangpawitan',
      'Kersamanah',
      'Leles',
      'Leuwigoong',
      'Malangbong',
      'Mekarmukti',
      'Pakenjeng',
      'Pameungpeuk',
      'Pamulihan',
      'Pangatikan',
      'Pasirwangi',
      'Peundeuy',
      'Samarang',
      'Sucinaraja',
      'Sukaresmi',
      'Sukawening',
      'Tarogong Kaler',
      'Tarogong Kidul',
      'Wanaraja',
    ],
    'Kabupaten Indramayu': [
      'Anjatan',
      'Arahan',
      'Balongan',
      'Bangodua',
      'Bongas',
      'Cantigi',
      'Cikedung',
      'Gabuswetan',
      'Gantar',
      'Haurgeulis',
      'Indramayu',
      'Jatibarang',
      'Juntinyuat',
      'Karangampel',
      'Kedokan Bunder',
      'Kertasemaya',
      'Krangkeng',
      'Kroya',
      'Lelea',
      'Lohbener',
      'Losarang',
      'Pasekan',
      'Patrol',
      'Sindang',
      'Sliyeg',
      'Sukagumiwang',
      'Sukra',
      'Terisi',
      'Tukdana',
      'Widasari',
    ],
    'Kabupaten Karawang': [
      'Banyusari',
      'Batujaya',
      'Ciampel',
      'Cibuaya',
      'Cikampek',
      'Cilamaya Kulon',
      'Cilamaya Wetan',
      'Cilebar',
      'Jatisari',
      'Jayakerta',
      'Karawang Barat',
      'Karawang Timur',
      'Klari',
      'Kotabaru',
      'Kutawaluya',
      'Lemahabang',
      'Majalaya',
      'Pakisjaya',
      'Pangkalan',
      'Pedes',
      'Purwasari',
      'Rawamerta',
      'Rengasdengklok',
      'Talagasari',
      'Tegalwaru',
      'Telukjambe Barat',
      'Telukjambe Timur',
      'Tempuran',
      'Tirtajaya',
      'Tirtamulya',
    ],
    'Kabupaten Kuningan': [
      'Ciawigebang',
      'Cibeureum',
      'Cibingbin',
      'Cidahu',
      'Cigandamekar',
      'Cigugur',
      'Cilebak',
      'Cilimus',
      'Ciniru',
      'Cipicung',
      'Ciwaru',
      'Darma',
      'Garawangi',
      'Hantara',
      'Jalaksana',
      'Japara',
      'Kadugede',
      'Kalimanggis',
      'Karangkancana',
      'Kramatmulya',
      'Kuningan',
      'Lebakwangi',
      'Luragung',
      'Maleber',
      'Mandirancan',
      'Nusaherang',
      'Pancalang',
      'Pasawahan',
      'Selajambe',
      'Sindangagung',
      'Subang',
    ],
    'Kabupaten Majalengka': [
      'Argapura',
      'Banjaran',
      'Bantarujeg',
      'Cigasong',
      'Cikijing',
      'Cingambul',
      'Dawuan',
      'Jatitujuh',
      'Jatiwangi',
      'Kadipaten',
      'Kasokandel',
      'Kertajati',
      'Lemahsugih',
      'Leuwimunding',
      'Ligung',
      'Maja',
      'Majalengka',
      'Malausma',
      'Palasah',
      'Panyingkiran',
      'Rajagaluh',
      'Sindang',
      'Sindangwangi',
      'Sukahaji',
      'Sumberjaya',
      'Talaga',
    ],
    'Kabupaten Pangandaran': [
      'Cigugur',
      'Cijulang',
      'Cimerak',
      'Kalipucang',
      'Langkaplancar',
      'Mangunjaya',
      'Padaherang',
      'Pangandaran',
      'Parigi',
      'Sidamulih',
    ],
    'Kabupaten Purwakarta': [
      'Babakancikao',
      'Bojong',
      'Bungursari',
      'Campaka',
      'Cibatu',
      'Darangdan',
      'Jatiluhur',
      'Kiarapedes',
      'Maniis',
      'Pasawahan',
      'Plered',
      'Pondoksalam',
      'Purwakarta',
      'Sukasari',
      'Tegalwaru',
      'Wanayasa',
    ],
    'Kabupaten Subang': [
      'Binong',
      'Blanakan',
      'Ciasem',
      'Ciater',
      'Cibogo',
      'Cijambe',
      'Cikaum',
      'Cipeundeuy',
      'Cipunagara',
      'Cisalak',
      'Compreng',
      'Dawuan',
      'Jalancagak',
      'Kalijati',
      'Kasomalang',
      'Legonkulon',
      'Pabuaran',
      'Pagaden',
      'Pagaden Barat',
      'Pamanukan',
      'Patokbeusi',
      'Purwadadi',
      'Pusakajaya',
      'Pusakanagara',
      'Sagalaherang',
      'Serangpanjang',
      'Subang',
      'Sukasari',
      'Tambakdahan',
      'Tanjungsiang',
    ],
    'Kabupaten Sukabumi': [
      'Bantargadung',
      'Bojonggenteng',
      'Caringin',
      'Ciambar',
      'Cibadak',
      'Cibitung',
      'Cicantayan',
      'Cidahu',
      'Cidolog',
      'Ciemas',
      'Cikakak',
      'Cikembar',
      'Cikidang',
      'Cimanggu',
      'Ciracap',
      'Cireunghas',
      'Cisaat',
      'Cisolok',
      'Curugkembar',
      'Gegerbitung',
      'Gunungguruh',
      'Jampangkulon',
      'Jampangtengah',
      'Kabandungan',
      'Kadudampit',
      'Kalapanunggal',
      'Kebonpedes',
      'Lengkong',
      'Nagrak',
      'Nyalindung',
      'Parakansalak',
      'Parungkuda',
      'Pelabuhanratu',
      'Purabaya',
      'Sagaranten',
      'Simpenan',
      'Sukabumi',
      'Sukalarang',
      'Surade',
      'Tegalbuleud',
      'Waluran',
      'Warungkiara',
    ],
    'Kabupaten Sumedang': [
      'Buahdua',
      'Cibugel',
      'Cimalaka',
      'Cimanggung',
      'Cisarua',
      'Cisitu',
      'Conggeang',
      'Darmaraja',
      'Ganeas',
      'Jatinangor',
      'Jatigede',
      'Jatinunggal',
      'Pamulihan',
      'Paseh',
      'Rancakalong',
      'Situraja',
      'Sumedang Selatan',
      'Sumedang Utara',
      'Surian',
      'Tanjungkerta',
      'Tanjungmedar',
      'Tanjungsari',
      'Tomo',
      'Ujungjaya',
      'Wado',
    ],
    'Kabupaten Tasikmalaya': [
      'Bantarkalong',
      'Bojongasih',
      'Bojonggambir',
      'Ciawi',
      'Cibalong',
      'Cigalontang',
      'Cikalong',
      'Cikatomas',
      'Cineam',
      'Cipatujah',
      'Cisayong',
      'Culamega',
      'Gunung Tanjung',
      'Jamanis',
      'Jatiwaras',
      'Kadipaten',
      'Karangjaya',
      'Leuwisari',
      'Mangunreja',
      'Manonjaya',
      'Pagerageung',
      'Pancatengah',
      'Parungponteng',
      'Puspahiang',
      'Rajapolah',
      'Salawu',
      'Sariwangi',
      'Singaparna',
      'Sodonghilir',
      'Sukaraja',
      'Sukarame',
      'Sukaratu',
      'Sukaresik',
      'Tanjungjaya',
      'Taraju',
    ],
  };

  String _selectedProvince = 'Jawa Barat';
  String? _selectedCity;
  String? _selectedDistrict;

  String _shippingMethod = 'JNE Regular';
  int _shippingCost = 15000;
  String _paymentMethod = 'Transfer BCA';

  List<String> get _availableCities {
    return _cityOptions[_selectedProvince] ?? [];
  }

  List<String> get _availableDistricts {
    if (_selectedCity == null) return [];
    return _districtOptions[_selectedCity] ?? [];
  }

  int get _productSubtotal {
    return widget.cartItems.fold(0, (sum, item) => sum + item.subtotal);
  }

  int get _totalPayment => _productSubtotal + _shippingCost;

  int get _totalQuantity {
    return widget.cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  void dispose() {
    _recipientNameController.dispose();
    _phoneController.dispose();
    _villageController.dispose();
    _postalCodeController.dispose();
    _detailAddressController.dispose();
    _addressNoteController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showPaymentMethodSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22242A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _paymentMethods.length,
                      itemBuilder: (context, index) {
                        final method = _paymentMethods[index];
                        final isSelected = method == _paymentMethod;

                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            setState(() {
                              _paymentMethod = method;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFF1F4FB)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF304A83)
                                    : const Color(0xFFD8DCE5),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: Color(0xFF8C8F9A),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    method,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                      color: const Color(0xFF22242A),
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF304A83),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showShippingMethodSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih Opsi Pengiriman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22242A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _shippingOptions.length,
                      itemBuilder: (context, index) {
                        final option = _shippingOptions[index];
                        final name = option['name'] as String;
                        final cost = option['cost'] as int;
                        final isSelected = name == _shippingMethod;

                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            setState(() {
                              _shippingMethod = name;
                              _shippingCost = cost;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFF1F4FB)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF304A83)
                                    : const Color(0xFFD8DCE5),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.local_shipping_outlined,
                                  color: Color(0xFF8C8F9A),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                          color: const Color(0xFF22242A),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        AppFormat.rupiah(cost),
                                        style: const TextStyle(
                                          color: Color(0xFF8C8F9A),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF304A83),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _submitOrder() async {
    final recipientName = _recipientNameController.text.trim();
    final phone = _phoneController.text.trim();
    final village = _villageController.text.trim();
    final postalCode = _postalCodeController.text.trim();
    final detailAddress = _detailAddressController.text.trim();
    final addressNote = _addressNoteController.text.trim();

    if (recipientName.isEmpty) {
      _showError('Nama penerima wajib diisi');
      return;
    }

    if (phone.isEmpty) {
      _showError('Nomor telepon wajib diisi');
      return;
    }

    if (_selectedProvince.isEmpty) {
      _showError('Provinsi wajib dipilih');
      return;
    }

    if (_selectedCity == null || _selectedCity!.isEmpty) {
      _showError('Kota / Kabupaten wajib dipilih');
      return;
    }

    if (_selectedDistrict == null || _selectedDistrict!.isEmpty) {
      _showError('Kecamatan wajib dipilih');
      return;
    }

    if (village.isEmpty) {
      _showError('Kelurahan / Desa wajib diisi');
      return;
    }

    if (postalCode.isEmpty) {
      _showError('Kode pos wajib diisi');
      return;
    }

    if (detailAddress.isEmpty) {
      _showError('Detail alamat wajib diisi');
      return;
    }

    final firstItem = widget.cartItems.first;
    final now = DateTime.now();

    final orderDate =
        '${now.day.toString().padLeft(2, '0')} '
        '${_monthName(now.month)} ${now.year}, '
        '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}';

    final fullAddress = [
      'Penerima: $recipientName',
      detailAddress,
      village,
      _selectedDistrict!,
      _selectedCity!,
      _selectedProvince,
      postalCode,
      'Indonesia',
      if (addressNote.isNotEmpty) 'Catatan: $addressNote',
    ].join(', ');

    final productTitle = widget.cartItems.length == 1
        ? firstItem.product.name
        : '${firstItem.product.name} + ${widget.cartItems.length - 1} item lainnya';

    final order = OrderHistoryModel(
      orderId: 'ORD-${now.millisecondsSinceEpoch}',
      orderDate: orderDate,
      productName: productTitle,
      productImage: firstItem.product.imageUrl,
      quantity: _totalQuantity,
      totalPrice: _totalPayment,
      paymentMethod: _paymentMethod,
      shippingMethod: _shippingMethod,
      address: fullAddress,
      statusOrder: 'Menunggu Konfirmasi',
      tracking: [
        OrderTrackingModel(
          title: 'Pesanan dibuat',
          time: orderDate,
          isDone: true,
        ),
        const OrderTrackingModel(
          title: 'Pembayaran dikonfirmasi',
          time: '-',
          isDone: false,
        ),
        const OrderTrackingModel(
          title: 'Pesanan diproses',
          time: '-',
          isDone: false,
        ),
        const OrderTrackingModel(
          title: 'Pesanan dikirim',
          time: '-',
          isDone: false,
        ),
        const OrderTrackingModel(
          title: 'Pesanan diterima',
          time: '-',
          isDone: false,
        ),
      ],
    );

    context.read<OrderHistoryViewModel>().addOrder(order);

    final success = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => StatusPesananPage(
          cartItems: widget.cartItems,
          phone: phone,
          address: fullAddress,
          shippingMethod: _shippingMethod,
          paymentMethod: _paymentMethod,
          shippingCost: _shippingCost,
        ),
      ),
    );

    if (success == true && mounted) {
      Navigator.pop(context, true);
    }
  }

  String _monthName(int month) {
    const months = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.cartItems.first;
    final isNetworkImage =
        item.product.imageUrl.startsWith('http://') ||
        item.product.imageUrl.startsWith('https://');

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        title: const Text(
          'Proses Pemesanan',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF22242A),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF22242A)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          _sectionTitle('INFORMASI PENERIMA'),
          _card(
            child: Column(
              children: [
                _fieldLabel('NAMA PENERIMA'),
                _textField(
                  _recipientNameController,
                  hint: 'Masukkan nama penerima',
                ),
                const SizedBox(height: 14),
                _fieldLabel('NO. TELEPHONE'),
                _textField(
                  _phoneController,
                  hint: '08xxxxxxxxxx',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 14),
                _fieldLabel('PROVINSI'),
                _buildDropdown<String>(
                  value: _selectedProvince,
                  hint: 'Pilih provinsi',
                  items: _provinceOptions,
                  enabled: true,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedProvince = value;
                      _selectedCity = null;
                      _selectedDistrict = null;
                    });
                  },
                ),
                const SizedBox(height: 14),
                _fieldLabel('KOTA / KABUPATEN'),
                _buildDropdown<String>(
                  value: _selectedCity,
                  hint: 'Pilih kota / kabupaten',
                  items: _availableCities,
                  enabled: true,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCity = value;
                      _selectedDistrict = null;
                    });
                  },
                ),
                const SizedBox(height: 14),
                _fieldLabel('KECAMATAN'),
                _buildDropdown<String>(
                  value: _selectedDistrict,
                  hint: 'Pilih kecamatan',
                  items: _availableDistricts,
                  enabled: _selectedCity != null,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedDistrict = value;
                    });
                  },
                ),
                const SizedBox(height: 14),
                _fieldLabel('KELURAHAN / DESA'),
                _textField(
                  _villageController,
                  hint: 'Masukkan kelurahan / desa',
                ),
                const SizedBox(height: 14),
                _fieldLabel('KODE POS'),
                _textField(
                  _postalCodeController,
                  hint: 'Masukkan kode pos',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 14),
                _fieldLabel('DETAIL ALAMAT'),
                TextField(
                  controller: _detailAddressController,
                  maxLines: 3,
                  decoration: _inputDecoration(
                    'Contoh: Jl. Melati No. 12, RT 01/RW 02',
                  ),
                ),
                const SizedBox(height: 14),
                _fieldLabel('CATATAN ALAMAT (OPSIONAL)'),
                TextField(
                  controller: _addressNoteController,
                  maxLines: 2,
                  decoration: _inputDecoration(
                    'Contoh: Rumah pagar hitam, dekat masjid',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('RINCIAN PESANAN'),
          _card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 82,
                    height: 82,
                    child: isNetworkImage
                        ? Image.network(
                            item.product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFF1F2F6),
                                child: const Icon(Icons.image_outlined),
                              );
                            },
                          )
                        : Image.asset(
                            item.product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFF1F2F6),
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
                        item.product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 8,
                        children: [
                          _specChip('UKURAN', item.size),
                          _specChip('WARNA', item.color.toUpperCase()),
                          _specChip('BAHAN', item.material.toUpperCase()),
                          _specChip('JUMLAH', '${item.quantity}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _sectionTitle('OPSI PENGIRIMAN'),
          _selectCard(
            title: _shippingMethod,
            subtitle: AppFormat.rupiah(_shippingCost),
            icon: Icons.local_shipping_outlined,
            onTap: _showShippingMethodSheet,
          ),
          const SizedBox(height: 18),
          _sectionTitle('METODE PEMBAYARAN'),
          _selectCard(
            title: _paymentMethod,
            subtitle: 'Tap untuk memilih metode pembayaran',
            icon: Icons.credit_card_outlined,
            onTap: _showPaymentMethodSheet,
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF11131A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RINGKASAN PEMBAYARAN',
                  style: TextStyle(
                    color: Color(0xFFC1C5D3),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 14),
                _summaryRow(
                  'Subtotal Produk',
                  AppFormat.rupiah(_productSubtotal),
                  color: Colors.white70,
                ),
                const SizedBox(height: 10),
                _summaryRow(
                  'Subtotal Pengiriman',
                  AppFormat.rupiah(_shippingCost),
                  color: Colors.white70,
                ),
                const SizedBox(height: 14),
                const Divider(color: Colors.white24),
                const SizedBox(height: 10),
                _summaryRow(
                  'TOTAL PEMBAYARAN',
                  AppFormat.rupiah(_totalPayment),
                  color: Colors.white,
                  isBold: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: _submitOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF11131A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'KONFIRMASI PESANAN',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 54,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: const BorderSide(color: Color(0xFFD5D8E2)),
              ),
              child: const Text(
                'BATALKAN',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: Color(0xFF22242A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF7F7FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E4EC)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E4EC)),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T? value,
    required String hint,
    required List<T> items,
    required bool enabled,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      isExpanded: true,
      decoration: _inputDecoration(hint),
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            ),
          )
          .toList(),
      onChanged: enabled ? onChanged : null,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          letterSpacing: 1.4,
          color: Color(0xFF8D90A0),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFD8DCE5)),
      ),
      child: child,
    );
  }

  Widget _fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF9A9EAB),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _textField(
    TextEditingController controller, {
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _inputDecoration(hint),
    );
  }

  Widget _specChip(String label, String value) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF9A9EAB),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF3A3A42),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectCard({
    required String title,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFD8DCE5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF989DAC), size: 28),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF8C8F9A),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFC0C3CE)),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    required Color color,
    bool isBold = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: isBold ? 16 : 15,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: isBold ? 16 : 15,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
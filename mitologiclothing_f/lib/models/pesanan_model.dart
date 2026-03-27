class PesananModel {
  final int? id;
  final String noTelephone;
  final String desain;
  final String ukuran;
  final String warna;
  final String bahan;
  final int jumlah;
  final String alamatPengguna;
  final String pengiriman;
  final int subtotalPembayaran;
  final int subtotalPengiriman;
  final int totalPembayaran;
  final String metodePembayaran;
  final String statusOrder;
  final int pricelistsId;

  const PesananModel({
    this.id,
    required this.noTelephone,
    required this.desain,
    required this.ukuran,
    required this.warna,
    required this.bahan,
    required this.jumlah,
    required this.alamatPengguna,
    required this.pengiriman,
    required this.subtotalPembayaran,
    required this.subtotalPengiriman,
    required this.totalPembayaran,
    required this.metodePembayaran,
    required this.statusOrder,
    required this.pricelistsId,
  });

  factory PesananModel.fromJson(Map<String, dynamic> json) {
    return PesananModel(
      id: json['id'],
      noTelephone: json['no_telephone'] ?? '',
      desain: json['desain'] ?? '',
      ukuran: json['ukuran'] ?? '',
      warna: json['warna'] ?? '',
      bahan: json['bahan'] ?? '',
      jumlah: json['jumlah'] ?? 0,
      alamatPengguna: json['alamat_pengguna'] ?? '',
      pengiriman: json['pengiriman'] ?? '',
      subtotalPembayaran: _parseInt(json['subtotal_pembayaran']),
      subtotalPengiriman: _parseInt(json['subtotal_pengiriman']),
      totalPembayaran: _parseInt(json['total_pembayaran']),
      metodePembayaran: json['metode_pembayaran'] ?? '',
      statusOrder: json['status_order'] ?? '',
      pricelistsId: json['pricelists_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_telephone': noTelephone,
      'desain': desain,
      'ukuran': ukuran,
      'warna': warna,
      'bahan': bahan,
      'jumlah': jumlah,
      'alamat_pengguna': alamatPengguna,
      'pengiriman': pengiriman,
      'subtotal_pembayaran': subtotalPembayaran,
      'subtotal_pengiriman': subtotalPengiriman,
      'total_pembayaran': totalPembayaran,
      'metode_pembayaran': metodePembayaran,
      'status_order': statusOrder,
      'pricelists_id': pricelistsId,
    };
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.round();
    return double.tryParse(value.toString())?.round() ?? 0;
  }
}
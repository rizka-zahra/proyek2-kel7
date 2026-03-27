class TagihanModel {
  final int? id;
  final String noTelephoneUser;
  final String detailPesanan;
  final int jumlahPesanan;
  final int harga;
  final int totalHarga;

  const TagihanModel({
    this.id,
    required this.noTelephoneUser,
    required this.detailPesanan,
    required this.jumlahPesanan,
    required this.harga,
    required this.totalHarga,
  });

  factory TagihanModel.fromJson(Map<String, dynamic> json) {
    return TagihanModel(
      id: json['id'],
      noTelephoneUser: json['no_telephone_user'] ?? '',
      detailPesanan: json['detail_pesanan'] ?? '',
      jumlahPesanan: json['jumlah_pesanan'] ?? 0,
      harga: _parseInt(json['harga']),
      totalHarga: _parseInt(json['total_harga']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_telephone_user': noTelephoneUser,
      'detail_pesanan': detailPesanan,
      'jumlah_pesanan': jumlahPesanan,
      'harga': harga,
      'total_harga': totalHarga,
    };
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.round();
    return double.tryParse(value.toString())?.round() ?? 0;
  }
}
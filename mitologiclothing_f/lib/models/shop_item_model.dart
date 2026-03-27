class ShopItemModel {
  final int id;
  final int kategoriBahanId;
  final String? categoryName;
  final String? detailBahan;
  final String imageUrl;
  final int price;
  final int stock;
  final String description;
  final List<String> availableColors;
  final List<String> availableSizes;

  const ShopItemModel({
    required this.id,
    required this.kategoriBahanId,
    this.categoryName,
    this.detailBahan,
    this.imageUrl = '',
    this.price = 0,
    this.stock = 0,
    this.description = '',
    this.availableColors = const ['Hitam'],
    this.availableSizes = const ['L'],
  });

  String get name {
    if ((detailBahan ?? '').trim().isNotEmpty) {
      return detailBahan!;
    }
    if ((categoryName ?? '').trim().isNotEmpty) {
      return categoryName!;
    }
    return 'Produk #$id';
  }

  String get category {
    if ((categoryName ?? '').trim().isNotEmpty) {
      return categoryName!;
    }
    return 'Kategori $kategoriBahanId';
  }

  String get displayDescription {
    if (description.trim().isNotEmpty) {
      return description;
    }
    if ((detailBahan ?? '').trim().isNotEmpty) {
      return detailBahan!;
    }
    return category;
  }

  factory ShopItemModel.fromPricelistJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id'] ?? 0,
      kategoriBahanId: json['kategori_bahan_id'] ?? 0,
      categoryName: json['kategori_bahan'] != null
          ? json['kategori_bahan']['nama_kategori']?.toString()
          : null,
      imageUrl: json['gambar'] ?? '',
      price: _parseInt(json['harga']),
      stock: 0,
      description: json['deskripsi']?.toString() ?? '',
      availableColors: const ['Hitam', 'Putih', 'Navy'],
      availableSizes: const ['S', 'M', 'L', 'XL'],
    );
  }

  factory ShopItemModel.fromStokJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id_stok'] ?? json['id'] ?? 0,
      kategoriBahanId: json['kategori_bahan_id'] ?? 0,
      categoryName: json['kategori_bahan'] != null
          ? json['kategori_bahan']['nama_kategori']?.toString()
          : null,
      detailBahan: json['detail_bahan'] ?? '',
      imageUrl: json['gambar'] ?? '',
      price: 0,
      stock: _parseInt(json['stok']),
      description: json['detail_bahan']?.toString() ?? '',
      availableColors: const ['Hitam', 'Putih', 'Navy'],
      availableSizes: const ['S', 'M', 'L', 'XL'],
    );
  }

  Map<String, dynamic> toPricelistJson() {
    return {
      'id': id,
      'kategori_bahan_id': kategoriBahanId,
      'harga': price,
      'gambar': imageUrl,
    };
  }

  Map<String, dynamic> toStokJson() {
    return {
      'id_stok': id,
      'kategori_bahan_id': kategoriBahanId,
      'detail_bahan': detailBahan,
      'stok': stock,
      'gambar': imageUrl,
    };
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.round();
    return double.tryParse(value.toString())?.round() ?? 0;
  }
}
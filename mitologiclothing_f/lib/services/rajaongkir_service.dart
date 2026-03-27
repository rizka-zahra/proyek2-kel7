import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rajaongkir_destination_model.dart';

class RajaOngkirService {
  static const String _apiKey = 'YOUR_RAJAONGKIR_API_KEY';

  Future<List<RajaOngkirDestinationModel>> searchDomesticDestination(
    String keyword,
  ) async {
    if (keyword.trim().isEmpty) return [];

    final uri = Uri.parse(
      'https://rajaongkir.komerce.id/api/v1/destination/domestic-destination'
      '?search=${Uri.encodeQueryComponent(keyword)}&limit=20&offset=0',
    );

    final response = await http.get(
      uri,
      headers: {
        'key': _apiKey,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal mengambil data alamat dari RajaOngkir');
    }

    final Map<String, dynamic> json = jsonDecode(response.body);
    final List data = json['data'] ?? [];

    return data
        .map((item) => RajaOngkirDestinationModel.fromJson(item))
        .toList();
  }
}
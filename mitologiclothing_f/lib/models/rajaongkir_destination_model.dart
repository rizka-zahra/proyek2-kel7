class RajaOngkirDestinationModel {
  final int id;
  final String label;
  final String provinceName;
  final String cityName;
  final String districtName;
  final String subdistrictName;
  final String zipCode;

  const RajaOngkirDestinationModel({
    required this.id,
    required this.label,
    required this.provinceName,
    required this.cityName,
    required this.districtName,
    required this.subdistrictName,
    required this.zipCode,
  });

  factory RajaOngkirDestinationModel.fromJson(Map<String, dynamic> json) {
    return RajaOngkirDestinationModel(
      id: json['id'] ?? 0,
      label: json['label'] ?? '',
      provinceName: json['province_name'] ?? '',
      cityName: json['city_name'] ?? '',
      districtName: json['district_name'] ?? '',
      subdistrictName: json['subdistrict_name'] ?? '',
      zipCode: json['zip_code'] ?? '',
    );
  }
}
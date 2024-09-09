class GeoModel {
  final String? lat;
  final String? lng;

  GeoModel({
    required this.lat,
    required this.lng,
  });

  factory GeoModel.empty() => GeoModel(lat: '', lng: '');

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"] as String?,
        lng: json["lng"] as String?,
      );
}

import 'package:example/base_api_client_example/data/model/geo_model.dart';

class AddressModel {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoModel? geo;

  AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory AddressModel.empty() => AddressModel(
        street: '',
        suite: '',
        city: '',
        zipcode: '',
        geo: GeoModel.empty(),
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: json["geo"] == null ? null : GeoModel.fromJson(json["geo"]),
      );
}

import 'package:example/base_api_client_example/data/model/geo_model.dart';
import 'package:example/base_api_client_example/domain/entity/geo_entity.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class GeoMapper implements Mapper<GeoModel, GeoEntity> {
  @override
  GeoEntity map(GeoModel from) {
    return GeoEntity(
      lat: double.tryParse(from.lat ?? '0.0') ?? 0.0,
      lng: double.tryParse(from.lng ?? '0.0') ?? 0.0,
    );
  }
}

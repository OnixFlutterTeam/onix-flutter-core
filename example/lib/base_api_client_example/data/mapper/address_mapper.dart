import 'package:example/base_api_client_example/data/mapper/geo_mapper.dart';
import 'package:example/base_api_client_example/data/model/address_model.dart';
import 'package:example/base_api_client_example/data/model/geo_model.dart';
import 'package:example/base_api_client_example/domain/entity/address_entity.dart';
import 'package:onix_flutter_core/core/arch/domain/common/converter/mapper.dart';

class AddressMapper implements Mapper<AddressModel, AddressEntity> {
  @override
  AddressEntity map(AddressModel from) {
    return AddressEntity(
      street: from.street ?? '',
      suite: from.suite ?? '',
      city: from.city ?? '',
      zipcode: from.zipcode ?? '',
      geo: GeoMapper().map(from.geo ?? GeoModel.empty()),
    );
  }
}

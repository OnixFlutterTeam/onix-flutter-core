import 'package:example/base_api_client_example/data/mapper/address_mapper.dart';
import 'package:example/base_api_client_example/data/mapper/company_mapper.dart';
import 'package:example/base_api_client_example/data/model/address_model.dart';
import 'package:example/base_api_client_example/data/model/company_model.dart';
import 'package:example/base_api_client_example/data/model/user_model.dart';
import 'package:example/base_api_client_example/domain/entity/user_entity.dart';
import 'package:onix_flutter_core/core/arch/domain/common/converter/mapper.dart';

class UserMapper implements Mapper<UserModel, UserEntity> {
  @override
  UserEntity map(UserModel from) {
    return UserEntity(
      id: from.id ?? -1,
      name: from.name ?? '',
      username: from.username ?? '',
      email: from.email ?? '',
      address: AddressMapper().map(from.address ?? AddressModel.empty()),
      phone: from.phone ?? '',
      website: from.website ?? '',
      company: CompanyMapper().map(from.company ?? CompanyModel.empty()),
    );
  }
}

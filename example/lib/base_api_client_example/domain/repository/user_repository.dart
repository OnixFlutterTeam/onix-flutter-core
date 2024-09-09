import 'package:example/base_api_client_example/domain/entity/user_entity.dart';
import 'package:onix_flutter_core/core/arch/domain/entity/common/result.dart';

abstract interface class UserRepository {
  Future<Result<List<UserEntity>>> getUsers();
}

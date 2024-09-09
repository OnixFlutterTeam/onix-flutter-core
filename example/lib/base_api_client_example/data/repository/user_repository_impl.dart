import 'package:example/base_api_client_example/data/defalt_api_error.dart';
import 'package:example/base_api_client_example/data/mapper/user_mapper.dart';
import 'package:example/base_api_client_example/data/source/user_source.dart';
import 'package:example/base_api_client_example/domain/entity/user_entity.dart';
import 'package:example/base_api_client_example/domain/repository/user_repository.dart';
import 'package:onix_flutter_core/core/arch/domain/entity/common/result.dart';
import 'package:onix_flutter_core/core/arch/data/remote/base/map_common_server_error.dart';
import 'package:onix_flutter_core/core/arch/domain/entity/failure/networking/api_failure.dart';

class UserRepositoryImpl implements UserRepository {
  final UserSource _userSource;
  final _userMapper = UserMapper();

  UserRepositoryImpl(this._userSource);

  @override
  Future<Result<List<UserEntity>>> getUsers() async {
    try {
      final userResponse = await _userSource.getUsers();

      if (userResponse.isSuccess()) {
        final models = userResponse.data.users ?? List.empty();
        final users = models
            .map(
              (model) => _userMapper.map(model),
            )
            .toList();

        return Result.success(users);
      } else {
        final failure = MapCommonServerError.getServerFailureDetails(
          userResponse,
          (error, _) {
            if (error is DefaultApiError) {
              return ApiFailure(
                ServerFailure.response,
                message: error.message ?? '',
              );
            }
            return ApiFailure(ServerFailure.response);
          },
        );
        return Result.error(failure: failure);
      }
    } catch (e) {
      return Result.error(
        failure: ApiFailure(ServerFailure.unknown),
      );
    }
  }
}

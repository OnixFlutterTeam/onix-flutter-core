import 'package:example/base_api_client_example/data/model/user_model.dart';
import 'package:onix_flutter_core/core/arch/domain/entity/common/data_response.dart';

abstract interface class UserSource {
  Future<DataResponse<UserModelList>> getUsers();
}

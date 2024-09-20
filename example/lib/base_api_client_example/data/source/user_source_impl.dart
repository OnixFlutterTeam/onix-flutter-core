import 'package:example/base_api_client_example/data/defalt_api_error.dart';
import 'package:example/base_api_client_example/data/model/user_model.dart';
import 'package:example/base_api_client_example/data/source/user_source.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class UserSourceImpl implements UserSource {
  static const String _users = '/users';

  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;

  const UserSourceImpl(this._apiClient, this._dioRequestProcessor);

  @override
  Future<DataResponse<UserModelList>> getUsers() {
    return _dioRequestProcessor.processRequest(
        onRequest: () => _apiClient.client.get(_users),
        onResponse: (response) {
          return UserModelList.fromJson(response.data);
        },
        onCustomError: (code, data) {
          return DefaultApiError(message: data?.data.toString());
        });
  }
}

import 'package:example/base_api_client_example/data/model/user_model.dart';
import 'package:example/base_api_client_example/data/source/user_source.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_core/core/arch/domain/entity/common/data_response.dart';

class UserSourceImpl implements UserSource {
  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;

  const UserSourceImpl(this._apiClient, this._dioRequestProcessor);

  @override
  Future<DataResponse<UserModelList>> getUsers() {
    return _dioRequestProcessor.processRequest(
      onRequest: () => _apiClient.client.get('/users'),
      onResponse: (response) {
        return UserModelList.fromJson(response.data);
      },
      onCustomError: (code, data){

      }
    );
  }
}

import 'package:onix_flutter_core/core/arch/data/remote/dio/api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_client_module.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_const.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_core/core/arch/data/remote/graph_ql/graph_ql_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:onix_flutter_core/core/arch/data/remote/graph_ql/request_processor/graph_ql_request_processor_impl.dart';
import 'package:get_it/get_it.dart';

void registerRemote(GetIt getIt) {
  final dioClientModule = _DioClientModule();

  getIt
    ..registerLazySingleton<DioRequestProcessor>(
      dioClientModule.makeDioErrorHandler,
    )
    ..registerLazySingleton<ApiClient>(
      //TODO APP BASE URL we can change with with flavor: FlavorConfig.I.baseUrl
      () => dioClientModule.makeApiClient(DioConst.jsonPlaceholderBaseUrl),
      instanceName: DioConst.jsonPlaceholderInstance,
    )
    ..registerLazySingleton<ApiClient>(
      () => dioClientModule.makeApiClient(DioConst.timeApiBaseUrl),
      instanceName: DioConst.timeApiInstance,
    )
    ..registerLazySingleton<GraphQlRequestProcessor>(
      GraphQlRequestProcessorImpl.new,
    )
    ..registerLazySingleton<GraphQlClient>(
      GraphQlClient.new,
    );
}

class _DioClientModule extends DioClientModule {}

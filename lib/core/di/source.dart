import 'package:onix_flutter_core/core/arch/data/remote/dio/api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_const.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_core/core/arch/data/remote/graph_ql/graph_ql_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/graph_ql/request_processor/graph_ql_request_processor.dart';
// import 'package:onix_flutter_core/data/source/remote/auth/auth_source.dart';
// import 'package:onix_flutter_core/data/source/remote/auth/auth_source_impl.dart';
// import 'package:onix_flutter_core/data/source/remote/time/time_source.dart';
// import 'package:onix_flutter_core/data/source/remote/time/time_source_impl.dart';
// import 'package:onix_flutter_core/data/source/remote/todo/todo_source.dart';
// import 'package:onix_flutter_core/data/source/remote/todo/todo_source_impl.dart';
import 'package:get_it/get_it.dart';

void registerSources(GetIt getIt) {
  // getIt
  //   ..registerLazySingleton<TodoSource>(
  //     () => TodoSourceImpl(
  //       getIt.get<ApiClient>(instanceName: DioConst.jsonPlaceholderInstance),
  //       getIt.get<DioRequestProcessor>(),
  //     ),
  //   )
  //   ..registerLazySingleton<TimeSource>(
  //     () => TimeSourceImpl(
  //       getIt.get<ApiClient>(instanceName: DioConst.timeApiInstance),
  //       getIt.get<DioRequestProcessor>(),
  //     ),
  //   )
  //   ..registerLazySingleton<AuthSource>(
  //     () => AuthSourceImpl(
  //       getIt.get<GraphQlClient>(),
  //       getIt.get<GraphQlRequestProcessor>(),
  //     ),
  //   );
}

// import 'package:onix_flutter_core/app/service/app_service.dart';
// import 'package:onix_flutter_core/app/service/session/session_service.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_const.dart';
// import 'package:onix_flutter_core/domain/repository/token_repository.dart';
import 'package:get_it/get_it.dart';

void registerCoreServices(GetIt getIt) {
  //getIt.registerLazySingleton<AppService>(AppService.new);
}

void registerAppServices(GetIt getIt) {
  // getIt.registerLazySingleton<SessionService>(
  //   () => SessionService(
  //     GetIt.I.get<ApiClient>(instanceName: DioConst.jsonPlaceholderInstance),
  //     GetIt.I.get<TokenRepository>(),
  //   ),
  // );
}

// extension AppServiceExtension on GetIt {
//   SessionService sessionService() => get<SessionService>();
//
//   AppService environmentService() => get<AppService>();
// }

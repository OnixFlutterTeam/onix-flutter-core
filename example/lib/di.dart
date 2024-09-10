import 'package:example/base_api_client_example/data/log_interceptor.dart';
import 'package:example/base_bloc_example/bloc/base_bloc_example_screen_bloc.dart';
import 'package:example/base_cubit_example/cubit/base_cubit_example_screen_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_client_module.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/params/api_client_params.dart';

import 'base_api_client_example/data/repository/user_repository_impl.dart';
import 'base_api_client_example/data/source/user_source.dart';
import 'base_api_client_example/data/source/user_source_impl.dart';
import 'base_api_client_example/domain/repository/user_repository.dart';

void initializeDi(GetIt getIt) {
  // Registering the BLoC class
  getIt.registerFactory<BaseBlocExampleScreenBloc>(
      BaseBlocExampleScreenBloc.new);

  // Registering the Cubit class
  getIt.registerFactory<BaseCubitExampleScreenCubit>(
      BaseCubitExampleScreenCubit.new);

  // Registering the API client class
  final dioClientModule = _DioClientModule();

  getIt.registerLazySingleton<ApiClient>(
    () => dioClientModule.makeApiClient(
      ApiClientParams(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        defaultConnectTimeout: 5000,
        defaultReceiveTimeout: 5000,
        interceptors: [LogInterceptor()],
      ),
    ),
    instanceName: 'apiInstanceName',
  );

  // Registering DioRequestProcessor
  getIt.registerLazySingleton<DioRequestProcessor>(
    dioClientModule.makeDioRequestProcessor,
  );

  // Registering UserSource
  getIt.registerLazySingleton<UserSource>(
    () => UserSourceImpl(
      getIt<ApiClient>(instanceName: 'apiInstanceName'),
      getIt<DioRequestProcessor>(),
    ),
  );

  // Registering UserRepository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      getIt<UserSource>(),
    ),
  );
}

class _DioClientModule extends DioClientModule {}

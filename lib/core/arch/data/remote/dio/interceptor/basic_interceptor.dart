import 'dart:io';

import 'package:onix_flutter_core/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_core/core/arch/logger/app_logger_impl.dart';
import 'package:onix_flutter_core/core/di/services.dart';
//import 'package:onix_flutter_core/domain/repository/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

///This is example of Interceptor to apply authorization tokens to requests.
class BasicInterceptor extends InterceptorsWrapper {
  // TokenRepository _tokenRepository() => GetIt.I.get<TokenRepository>();
  //
  // @override
  // Future<void> onRequest(
  //   RequestOptions options,
  //   RequestInterceptorHandler handler,
  // ) async {
  //   final credentials = await _tokenRepository().getTokenCredentials();
  //   final token = credentials?.accessToken;
  //   if (token != null && token.isNotEmpty) {
  //     options.headers[BaseApiClient.kAuthHeader] =
  //         '${BaseApiClient.kAuthPrefix}$token';
  //   }
  //   super.onRequest(options, handler);
  // }
  //
  // @override
  // Future<void> onError(
  //   DioException err,
  //   ErrorInterceptorHandler handler,
  // ) async {
  //   logger.d('AppInterceptor start: $err');
  //   if (err.response?.statusCode == HttpStatus.unauthorized) {
  //     await GetIt.I.sessionService().closeSession();
  //     return;
  //   }
  //   super.onError(err, handler);
  // }
}

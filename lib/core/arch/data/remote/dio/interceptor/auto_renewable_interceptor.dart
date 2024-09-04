import 'package:onix_flutter_core/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/base/http_status.dart';
import 'package:onix_flutter_core/core/arch/logger/app_logger_impl.dart';
import 'package:onix_flutter_core/core/di/services.dart';
// import 'package:onix_flutter_core/data/mapper/auth/auth_mapper.dart';
// import 'package:onix_flutter_core/data/model/remote/request/token/token_request.dart';
// import 'package:onix_flutter_core/data/model/remote/response/auth/auth_response.dart';
// import 'package:onix_flutter_core/domain/entity/auth/auth_entity.dart';
// import 'package:onix_flutter_core/domain/repository/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

///This is example of Interceptor to apply authorization tokens to requests
///and automatically renew token on 401 error.
class AutoRenewableInterceptor extends QueuedInterceptorsWrapper {
  // late Dio _refreshDio;
  //
  // //TODO change refresh path
  // final _refreshPath = 'auth/refresh';
  //
  // AutoRenewableInterceptor() {
  //   _refreshDio = Dio();
  // }
  //
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
  //     options.headers.addAll(
  //       <String, String>{
  //         BaseApiClient.kAuthHeader: '${BaseApiClient.kAuthPrefix}$token',
  //       },
  //     );
  //   }
  //   handler.next(options);
  // }
  //
  // @override
  // Future<void> onError(
  //   DioException err,
  //   ErrorInterceptorHandler handler,
  // ) async {
  //   if (err.response?.statusCode == HttpStatus.unauthorized) {
  //     final credentials = await _tokenRepository().getTokenCredentials();
  //     final refreshToken = credentials?.refreshToken;
  //     final accessToken = credentials?.accessToken;
  //     try {
  //       if (refreshToken == null ||
  //           refreshToken.isEmpty ||
  //           accessToken == null ||
  //           accessToken.isEmpty) {
  //         await GetIt.I.sessionService().closeSession();
  //         return handler.next(err);
  //       }
  //       final request = TokenRequest(
  //         accessToken: accessToken,
  //         refreshToken: refreshToken,
  //       );
  //       final authEntity = await _refresh(err, request);
  //       return await _resolveRequest(err, handler, authEntity);
  //     } on DioException {
  //       if (err.response?.statusCode == HttpStatus.unauthorized) {
  //         await GetIt.I.sessionService().closeSession();
  //       }
  //     } catch (e, stackTrace) {
  //       logger.crash(error: e, stackTrace: stackTrace);
  //       await GetIt.I.sessionService().closeSession();
  //     }
  //   }
  //   handler.next(err);
  // }
  //
  // Future<AuthenticationEntity> _refresh(
  //   DioException err,
  //   TokenRequest request,
  // ) async {
  //   logger.d('_refresh start');
  //   final result = await _refreshDio.post(
  //     '${err.requestOptions.baseUrl}$_refreshPath',
  //     options: Options(
  //       headers: {
  //         BaseApiClient.kAcceptHeader: BaseApiClient.kJsonPrefix,
  //         BaseApiClient.kContentTypeHeader: BaseApiClient.kJsonPrefix,
  //         BaseApiClient.kAuthHeader:
  //             '${BaseApiClient.kAuthPrefix}${request.accessToken}',
  //       },
  //     ),
  //     data: request.toJson(),
  //   );
  //
  //   final responseBody = result.data as Map<String, dynamic>;
  //   final data = AuthResponse.fromJson(responseBody['data']);
  //   logger.d('_refresh end');
  //   return AuthMapper().mapRefreshEntity(data);
  // }
  //
  // Future<void> _resolveRequest(
  //   DioException err,
  //   ErrorInterceptorHandler handler,
  //   AuthenticationEntity authEntity,
  // ) async {
  //   await _tokenRepository().update(
  //     AuthenticationEntity(
  //       accessToken: authEntity.accessToken,
  //       refreshToken: authEntity.refreshToken,
  //     ),
  //   );
  //   final requestOptions = err.response?.requestOptions;
  //   if (requestOptions != null) {
  //     requestOptions.headers[BaseApiClient.kAuthHeader] =
  //         '${BaseApiClient.kAuthPrefix}${authEntity.accessToken}';
  //     final options = Options(
  //       method: requestOptions.method,
  //       headers: requestOptions.headers,
  //     );
  //     final dioRefresh = Dio(
  //       BaseOptions(baseUrl: requestOptions.baseUrl),
  //     );
  //     final response = await dioRefresh.request<dynamic>(
  //       requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options,
  //     );
  //     return handler.resolve(response);
  //   }
  //   logger.e('err: $err');
  //   return handler.next(err);
  // }
}

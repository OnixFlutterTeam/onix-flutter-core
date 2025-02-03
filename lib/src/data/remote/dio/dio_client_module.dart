import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core/src/data/remote/dio/internal_dio_retry_policy.dart';

abstract class DioClientModule {
  /// Number of attempts to re-execute the request
  static const defaultMaxAttemptsCount = 2;

  /// Error codes that require re-execution of the request (without bad request)
  /// Basic list of error codes that require re-execution of the request
  static const defaultRetryStatusCodes = [
    HttpStatus.badGateway,
    HttpStatus.serviceUnavailable,
  ];

  ApiClient makeApiClient(ApiClientParams params) => ApiClient(
        interceptors: params.interceptors,
        options: BaseOptions(
          baseUrl: params.baseUrl,
          connectTimeout: Duration(milliseconds: params.defaultConnectTimeout),
          receiveTimeout: Duration(milliseconds: params.defaultReceiveTimeout),
          headers: params.headers ??
              {
                BaseApiClient.kAcceptHeader: BaseApiClient.kJsonPrefix,
                BaseApiClient.kContentTypeHeader: BaseApiClient.kJsonPrefix,
              },
        ),
      );

  RequestProcessor createInternalDioRequestProcessor({
    RetryPolicy? retryPolicy,
    ConnectionChecker? connectionChecker,
    ErrorProcessor? errorProcessor,
    OnCustomError? customErrorParser,
  }) =>
      InternalDioRequestProcessor(
        retryPolicy: InternalDioRetryPolicy(
          maxAttemptsCount: defaultMaxAttemptsCount,
          retryStatusCodes: defaultRetryStatusCodes,
        ),
        errorProcessor: errorProcessor,
        connectionChecker: (kIsWeb) ? null : connectionChecker,
        onCustomError: customErrorParser,
      );

}

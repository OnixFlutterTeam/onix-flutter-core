import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('╔${'═' * 79}');
      print('║ Request: ${options.method} ${options.uri}');
      print('║ Request headers: ${options.headers}');
      print('║ Request data: ${options.data}');
      print('╚${'═' * 79}\n');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('╔${'═' * 79}');
      print(
          '║ Response: ${response.statusCode} ${response.requestOptions.uri}');
      print('║ Response headers:');
      for (final header in response.headers.map.entries) {
        print('║    ${header.key}: ${header.value}');
      }
      print('║ Response data:');
      for (final entry in (response.data as List<dynamic>)) {
        print('║    $entry');
      }
      print('╚${'═' * 79}\n');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('LogInterceptor::Error: ${err.error}');
    }

    handler.next(err);
  }
}

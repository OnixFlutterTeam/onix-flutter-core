import 'package:dio/dio.dart';

class ApiClientParams {
  final String baseUrl;
  final List<Interceptor> interceptors;
  final int defaultConnectTimeout;
  final int defaultReceiveTimeout;
  final Map<String, dynamic>? headers;

  ApiClientParams({
    required this.baseUrl,
    this.interceptors = const [],
    this.defaultConnectTimeout = 30000,
    this.defaultReceiveTimeout = 30000,
    this.headers,
  });
}

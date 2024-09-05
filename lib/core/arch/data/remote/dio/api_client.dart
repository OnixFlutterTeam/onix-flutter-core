import 'dart:io';

import 'package:onix_flutter_core/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/interceptor/cache_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient implements BaseApiClient<Dio> {
  final List<Interceptor> _interceptors;

  CacheInterceptor? _cacheInterceptor;

  @override
  late Dio client;

  CacheOptions? get cacheOptions => _cacheInterceptor?.cacheOptions;

  ApiClient({
    required BaseOptions options,
    List<Interceptor> interceptors = const [],
  }) : _interceptors = interceptors {
    client = Dio(options);
    client.transformer = BackgroundTransformer();
    attachLoggerInterceptor();
    attachInterceptors();
  }

  @override
  void attachLoggerInterceptor() {
    if (kDebugMode) {
      client.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          compact: false,
        ),
      );
    }
  }

  @override
  void attachInterceptors() {
    if(_interceptors.isNotEmpty){
      client.interceptors.clear();
      client.interceptors.addAll(_interceptors);
    }
    if (_cacheInterceptor != null) {
      _reAttachCacheInterceptor();
    }
  }

  @override
  void attachCacheInterceptor(CacheInterceptor cacheInterceptor) {
    _cacheInterceptor = cacheInterceptor;
    _reAttachCacheInterceptor();
  }

  @override
  void deAttachInterceptors() {
    client.interceptors.clear();
    if (_cacheInterceptor != null) {
      clearCache();
    }
  }

  void attachCharlesProxy(String? charlesIp, String? port) {
    if (charlesIp == null || port == null) return;
    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient()
          ..findProxy = (uri) => 'PROXY $charlesIp:$port';

        //ignore: cascade_invocations
        client.badCertificateCallback = (cert, host, port) => true;

        return client;
      },
    );
  }

  CachePolicy getCachePolicy({required bool forceRefresh}) =>
      _cacheInterceptor?.getCachePolicy(forceRefresh: forceRefresh) ??
      CachePolicy.noCache;

  Future<void> clearCache() async {
    await _cacheInterceptor?.clearCache();
    await _reAttachCacheInterceptor();
  }

  String customCacheKeyBuilder(RequestOptions request) =>
      _cacheInterceptor?.customCacheKeyBuilder(request) ?? '';

  Future<void> _reAttachCacheInterceptor() async {
    _cacheInterceptor?.deAttachInterceptor();
    await _cacheInterceptor?.attachCacheInterceptor();
  }
}

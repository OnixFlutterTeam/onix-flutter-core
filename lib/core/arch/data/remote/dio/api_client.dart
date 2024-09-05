import 'dart:io';

import 'package:onix_flutter_core/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/interceptor/cache_interceptor.dart';
import 'package:onix_flutter_core/core/arch/logger/app_logger_impl.dart';
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
    for (final interceptor in _interceptors) {
      client.interceptors.remove(interceptor);
      client.interceptors.add(interceptor);
    }
    if (_cacheInterceptor != null) {
      _attachCacheInterceptor();
    }
  }

  @override
  void attachCacheInterceptor(CacheInterceptor cacheInterceptor) {
    _cacheInterceptor = cacheInterceptor;
    _attachCacheInterceptor();
  }

  @override
  void deAttachInterceptors() {
    for (final interceptor in _interceptors) {
      client.interceptors.remove(interceptor);
    }
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
    logger.d('CharlesProxyEnabled');
  }

  CachePolicy getCachePolicy({required bool forceRefresh}) =>
      _cacheInterceptor?.getCachePolicy(forceRefresh: forceRefresh) ??
      CachePolicy.noCache;

  Future<void> clearCache() async {
    logger.d('clearCache');
    await _cacheInterceptor?.clearCache();
    await _attachCacheInterceptor();
  }

  String customCacheKeyBuilder(RequestOptions request) =>
      _cacheInterceptor?.customCacheKeyBuilder(request) ?? '';

  Future<void> _attachCacheInterceptor() async {
    logger.d('attachCacheInterceptor');
    _cacheInterceptor?.deAttachInterceptor();
    await _cacheInterceptor?.attachCacheInterceptor();
  }
}

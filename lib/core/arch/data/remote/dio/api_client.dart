import 'dart:io';

import 'package:onix_flutter_core/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/interceptor/basic_interceptor.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/interceptor/cache_interceptor.dart';
import 'package:onix_flutter_core/core/arch/logger/app_logger_impl.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient implements BaseApiClient<Dio> {
  static const defaultConnectTimeout = 30000;
  static const defaultReceiveTimeout = 30000;

  late BasicInterceptor customInterceptor;
  late CacheInterceptor cacheInterceptor;

  @override
  late Dio client;

  //CacheOptions? get cacheOptions => cacheInterceptor.cacheOptions;

  ApiClient({required BaseOptions options}) {
    client = Dio(options);
    customInterceptor = BasicInterceptor();
    //cacheInterceptor = CacheInterceptor(client);
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
    client.interceptors.remove(customInterceptor);
    client.interceptors.add(customInterceptor);
    //_attachCacheInterceptor();
  }

  @override
  void deAttachInterceptors() {
    client.interceptors.remove(customInterceptor);
    //clearCache();
  }

  void attachCharlesProxy(String? charlesIp, String? port) {
    if (charlesIp == null || port == null) return;
    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient()
          ..findProxy = (uri) => 'PROXY $charlesIp:$port';

        //ignore: cascade_invocations
        client.badCertificateCallback = (cert, host, port) => true;

        // You can also create a new HttpClient for Dio instead of returning,
        // but a client must being returned here.
        return client;
      },
    );
    logger.d('CharlesProxyEnabled');
  }

  // CachePolicy getCachePolicy({required bool forceRefresh}) =>
  //     cacheInterceptor.getCachePolicy(forceRefresh: forceRefresh);
  //
  // Future<void> clearCache() async {
  //   logger.d('clearCache');
  //   await cacheInterceptor.clearCache();
  //   await _attachCacheInterceptor();
  // }
  //
  // String customCacheKeyBuilder(RequestOptions request) =>
  //     cacheInterceptor.customCacheKeyBuilder(request);
  //
  // Future<void> _attachCacheInterceptor() async {
  //   logger.d('attachCacheInterceptor');
  //   cacheInterceptor.deAttachInterceptor();
  //   await cacheInterceptor.attachCacheInterceptor();
  // }
}

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

abstract interface class CacheInterceptor {
  final Dio client;

  CacheOptions? cacheOptions;

  CacheInterceptor(this.client);

  Future<void> attachCacheInterceptor();

  Future<CacheOptions> createOptions();

  CachePolicy getCachePolicy({required bool forceRefresh});

  Future<void> clearCache();

  void deAttachInterceptor();

  String customCacheKeyBuilder(RequestOptions request);
}

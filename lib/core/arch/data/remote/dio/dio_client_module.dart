import 'package:onix_flutter_core/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/api_client.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/dio_request_processor/dio_request_processor_impl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:onix_flutter_core/core/arch/data/remote/dio/params/api_client_params.dart';

abstract class DioClientModule {
  ApiClient makeApiClient(ApiClientParams params) => ApiClient(
        interceptors: params.interceptors,
        options: BaseOptions(
          baseUrl: params.baseUrl,
          connectTimeout: Duration(milliseconds: params.defaultConnectTimeout),
          receiveTimeout: Duration(milliseconds: params.defaultReceiveTimeout),
          headers: {
            BaseApiClient.kAcceptHeader: BaseApiClient.kJsonPrefix,
            BaseApiClient.kContentTypeHeader: BaseApiClient.kJsonPrefix,
          },
        ),
      );

  DioRequestProcessor makeDioErrorHandler() => kIsWeb
      ? DioRequestProcessorImpl()
      : DioRequestProcessorImpl(
          connectivity: Connectivity(),
          internetConnectionChecker: InternetConnectionChecker(),
        );
}

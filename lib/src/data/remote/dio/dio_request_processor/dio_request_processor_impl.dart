import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/src/data/remote/connection_checker/connection_checker.dart';
import 'package:onix_flutter_core/src/data/remote/dio/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_core/src/data/remote/error/dio_error_processor.dart';
import 'package:onix_flutter_core/src/domain/entity/common/data_response.dart';
import 'package:retry/retry.dart';

class DioRequestProcessorImpl implements DioRequestProcessor {
  /// Number of attempts to re-execute the request
  static const defaultMaxAttemptsCount = 2;

  /// Error codes that require re-execution of the request (without bad request)
  /// Basic list of error codes that require re-execution of the request
  static const defaultRetryStatusCodes = [
    HttpStatus.badGateway,
    HttpStatus.serviceUnavailable,
  ];

  @protected
  final ConnectionChecker? internetConnectionChecker;
  final int maxAttemptsCount;
  @protected
  final bool useRetry;
  @protected
  final List<int> retryStatusCodes;
  final _errorProcessor = const DioErrorProcessor();

  DioRequestProcessorImpl({
    this.internetConnectionChecker,
    this.useRetry = false,
    this.maxAttemptsCount = defaultMaxAttemptsCount,
    this.retryStatusCodes = defaultRetryStatusCodes,
  });

  @override
  Future<DataResponse<R>> processRequest<T, R>({
    required OnRequest<T> onRequest,
    required OnResponse<R> onResponse,
    bool checkNetworkConnection = true,
    OnCustomError? onCustomError,
  }) async {
    if (internetConnectionChecker != null) {
      final hasConnection =
          await internetConnectionChecker?.hasConnection() ?? false;

      if (checkNetworkConnection && !hasConnection) {
        return DataResponse<R>.notConnected();
      }
    }

    try {
      final response = await _call(onRequest);
      return DataResponse.success(onResponse(response as Response<dynamic>));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return const DataResponse.canceledRequest();
      }

      return _errorProcessor.processError(
        e,
        onCustomError: onCustomError,
      );
    } catch (e, trace) {
      if (kDebugMode) {
        print('onDioCommonError::DioRequestProcessorImpl');
        print(e);
        print(trace);
      }
      return DataResponse.undefinedError(e);
    }
  }

  Future<T> _call<T>(OnRequest<T> request) async {
    if (useRetry) {
      return retry(
        request,
        maxAttempts: maxAttemptsCount,
        retryIf: (exception) => _retryPolicy(
          exception: exception,
          retryStatusCodes: retryStatusCodes,
        ),
      );
    } else {
      return request();
    }
  }

  FutureOr<bool> _retryPolicy({
    required Exception exception,
    required List<int> retryStatusCodes,
  }) {
    if (exception is! DioException) return false;
    if (exception.type == DioExceptionType.cancel) return false;
    final response = exception.response;
    if (response == null) {
      return true;
    }
    if (exception is SocketException || exception is TimeoutException) {
      return true;
    }
    return retryStatusCodes.contains(response.statusCode);
  }
}

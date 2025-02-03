import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/src/data/remote/base/connection_checker.dart';
import 'package:onix_flutter_core/src/data/remote/base/processor/error_processor.dart';
import 'package:onix_flutter_core/src/data/remote/base/processor/request_processor.dart';
import 'package:onix_flutter_core/src/data/remote/base/retry_policy.dart';
import 'package:onix_flutter_core/src/data/remote/connection_checker/always_have_connection.dart';
import 'package:onix_flutter_core/src/domain/entity/common/data_response.dart';
import 'package:retry/retry.dart';

class InternalDioRequestProcessor extends RequestProcessor {
  final ErrorProcessor _errorProcessor;

  final RetryPolicy? _retryPolicy;

  final ConnectionChecker _connectionChecker;

  final OnCustomError? _onCustomError;

  InternalDioRequestProcessor({
    RetryPolicy? retryPolicy,
    ErrorProcessor? errorProcessor,
    ConnectionChecker? connectionChecker,
    OnCustomError? onCustomError,
  })  : _errorProcessor = errorProcessor ?? ErrorProcessor.internal(),
        _retryPolicy = retryPolicy,
        _connectionChecker = connectionChecker ?? AlwaysHaveConnection(),
        _onCustomError = onCustomError;

  @override
  Future<DataResponse<R>> processRequest<T, R>({
    required OnRequest<T> onRequest,
    required OnParse<R> onParse,
    OnCustomError? onCustomRequestError,
    bool checkNetworkConnection = true,
  }) async {
    //step 1: check connection
    if (checkNetworkConnection) {
      final hasConnection = await hasInternetConnection(
        _connectionChecker,
      );
      if (!hasConnection) {
        return DataResponse<R>.notConnected();
      }
    }
    try {
      if (_retryPolicy != null) {
        final response = await retry(
          onRequest,
          maxAttempts: _retryPolicy.maxAttemptsCount,
          retryIf: (exception) => _retryPolicy.onRetry(
            exception: exception,
          ),
        );
        return DataResponse.success(
          onParse((response as Response<dynamic>)),
        );
      } else {
        final response = await onRequest();
        return DataResponse.success(
          onParse((response as Response<dynamic>)),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return DataResponse.canceledRequest();
      }

      return _errorProcessor.processError(
        e,
        onCustomError: onCustomRequestError ?? _onCustomError,
      );
    } catch (e, trace) {
      if (kDebugMode) {
        print('onDioCommonError::DioRequestProcessorImpl');
        print(e);
        print(trace);
      }

      return DataResponse.undefinedError(
        e,
        -1,
        trace,
      );
    }
  }

  @override
  Future<bool> hasInternetConnection(
    ConnectionChecker connectionChecker,
  ) =>
      connectionChecker.hasConnection();
}

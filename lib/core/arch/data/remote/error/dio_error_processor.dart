import 'package:dio/dio.dart';
import 'package:onix_flutter_core/core/arch/data/remote/base/http_status.dart';
import 'package:onix_flutter_core/core/arch/domain/entity/common/data_response.dart';

typedef OnCustomError<T> = dynamic Function(
  int code,
  Map<String, dynamic> response,
);

class DioErrorProcessor {
  const DioErrorProcessor();

  DataResponse<T> processError<T>(
    DioException e, {
    OnCustomError? onCustomError,
  }) {
    final responseData = e.response?.data;
    final statusCode = e.response?.statusCode ?? -1;
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        statusCode == HttpStatus.networkConnectTimeoutError) {
      return DataResponse<T>.notConnected();
    }
    if (statusCode == HttpStatus.unauthorized) {
      return DataResponse<T>.unauthorized();
    }
    if (statusCode == HttpStatus.tooManyRequests) {
      return DataResponse<T>.tooManyRequests();
    }

    final errorHandler = onCustomError;

    if (errorHandler != null) {
      final apiError = errorHandler(statusCode, responseData);
      if (apiError != null) {
        return DataResponse<T>.apiError(apiError, statusCode);
      }
    }

    return DataResponse<T>.undefinedError(e, statusCode);
  }
}

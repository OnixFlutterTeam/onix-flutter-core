import 'package:dio/dio.dart';
import 'package:onix_flutter_core/src/data/remote/base/http_status.dart';
import 'package:onix_flutter_core/src/data/remote/base/processor/error_processor.dart';
import 'package:onix_flutter_core/src/domain/entity/common/data_response.dart';

class InternalDioErrorProcessor implements ErrorProcessor {
  const InternalDioErrorProcessor();

  @override
  DataResponse<T> processError<T>(
    Exception e, {
    OnCustomError? onCustomError,
  }) {
    if (e is DioException) {
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
        final apiError = errorHandler(
          statusCode,
          e.response?.data,
        );
        return DataResponse<T>.apiError(apiError, statusCode);
      }
      return DataResponse<T>.undefinedError(
        e,
        statusCode,
      );
    }

    return DataResponse<T>.undefinedError(
      e,
      -1,
    );
  }
}

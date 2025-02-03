abstract class DataResponse<T> {
  const DataResponse();

  T get data => (this as DataResponseSuccess).data;

  bool isSuccess() => this is DataResponseSuccess;

  bool isError() => this is! DataResponseSuccess;

  factory DataResponse.success(T data) => DataResponseSuccess(data);

  factory DataResponse.undefinedError(
    Object? errorObject, [
    int? statusCode,
    StackTrace? trace,
  ]) =>
      UndefinedError(
        errorObject,
        statusCode,
        trace,
      );

  factory DataResponse.apiError(
    Object error, [
    int? statusCode,
  ]) =>
      ApiError(
        error,
        statusCode,
      );

  factory DataResponse.notConnected() => NoInternetConnection();

  factory DataResponse.unauthorized() => Unauthorized();

  factory DataResponse.tooManyRequests() => TooManyRequests();

  factory DataResponse.canceledRequest() => CanceledRequest();
}

final class DataResponseSuccess<T> extends DataResponse<T> {
  final T _data;

  @override
  T get data => _data;

  DataResponseSuccess(T data) : _data = data;
}

final class UndefinedError<T> extends DataResponse<T> {
  final Object? _errorObject;
  final int? _statusCode;
  final StackTrace? _trace;

  Object? get errorObject => _errorObject;

  int? get statusCode => _statusCode;

  StackTrace? get trace => _trace;

  UndefinedError(
    Object? errorObject, [
    int? statusCode,
    StackTrace? trace,
  ])  : _errorObject = errorObject,
        _statusCode = statusCode,
        _trace = trace;
}

final class ApiError<T> extends DataResponse<T> {
  final Object _error;
  final int? _statusCode;

  Object get error => _error;

  int? get statusCode => _statusCode;

  ApiError(
    Object error, [
    int? statusCode,
  ])  : _error = error,
        _statusCode = statusCode;
}

final class NoInternetConnection<T> extends DataResponse<T> {}

final class Unauthorized<T> extends DataResponse<T> {}

final class TooManyRequests<T> extends DataResponse<T> {}

final class CanceledRequest<T> extends DataResponse<T> {}

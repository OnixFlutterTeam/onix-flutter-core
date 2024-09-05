import 'package:onix_flutter_core/core/arch/domain/entity/failure/failure.dart';

class ApiFailure implements FeatureFailure {
  final ServerFailure failure;
  final int? statusCode;

  final String message;

  ApiFailure(
    this.failure, {
    this.message = '',
    this.statusCode,
  });

  @override
  String toString() {
    return 'ApiFailure{$failure, message: $message, statusCode: $statusCode}';
  }
}

class ApiUndefinedFailure extends ApiFailure {
  ApiUndefinedFailure({
    int? statusCode,
    required String message,
  }) : super(ServerFailure.unknown, message: message, statusCode: statusCode);

  @override
  String toString() {
    return 'ApiUndefinedFailure{failure: $failure, statusCode: $statusCode, message: $message}';
  }
}

class ConnectionFailure extends ApiFailure {
  ConnectionFailure() : super(ServerFailure.noNetwork, message: '');

  @override
  String toString() {
    return 'ConnectionFailure{failure: $failure}';
  }
}

class ApiExceptionFailure extends ApiFailure {
  ApiExceptionFailure({
    required String message,
  }) : super(ServerFailure.exception, message: message);

  @override
  String toString() {
    return 'ApiExceptionFailure{failure: $failure, message: $message}';
  }
}

class ApiUnauthorizedFailure extends ApiFailure {
  ApiUnauthorizedFailure() : super(ServerFailure.unAuthorized, message: '');

  @override
  String toString() {
    return 'ApiUnauthorizedFailure{failure: $failure}';
  }
}

class ApiTooManyRequestsFailure extends ApiFailure {
  ApiTooManyRequestsFailure()
      : super(ServerFailure.tooManyRequests, message: '');

  @override
  String toString() {
    return 'ApiTooManyRequestsFailure{failure: $failure}';
  }
}

class ApiUnknownFailure extends ApiFailure {
  ApiUnknownFailure() : super(ServerFailure.unknown, message: '');

  @override
  String toString() {
    return 'ApiUnknownFailure{failure: $failure}';
  }
}

enum ServerFailure {
  noNetwork,
  exception,
  unAuthorized,
  tooManyRequests,
  response,
  unknown,
}

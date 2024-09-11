import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/src/core/arch/domain/entity/common/data_response.dart';
import 'package:onix_flutter_core/src/core/arch/domain/entity/failure/failure.dart';
import 'package:onix_flutter_core/src/core/arch/domain/entity/failure/networking/api_failure.dart';
import 'package:onix_flutter_core/src/core/arch/domain/entity/failure/networking/canceled_request_failure.dart';

class MapCommonServerError {
  static Failure getServerFailureDetails<T>(
    DataResponse<T> failure,
    Function(dynamic, int?)? onApiFailure,
  ) {
    try {
      return failure.maybeWhen(
        undefinedError: (error, statusCode) => ApiUndefinedFailure(
          statusCode: statusCode,
          message: error.toString(),
        ),
        apiError: (error, statusCode) => onApiFailure != null
            ? onApiFailure(error, statusCode)?.call
            : ApiExceptionFailure(
                message:
                    'MapCommonServerError::Default error not defined properly.',
              ),
        notConnected: ConnectionFailure.new,
        unauthorized: ApiUnauthorizedFailure.new,
        tooManyRequests: ApiTooManyRequestsFailure.new,
        canceledRequest: CanceledRequestFailure.new,
        orElse: ApiUnknownFailure.new,
      );
    } catch (e, trace) {
      if(kDebugMode){
        print('MapCommonServerError::getServerFailureDetails');
        print(e);
        print(trace);
      }
      return ApiExceptionFailure(message: e.toString());
    }
  }
}

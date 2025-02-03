import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/src/data/remote/base/connection_checker.dart';
import 'package:onix_flutter_core/src/data/remote/base/processor/error_processor.dart';
import 'package:onix_flutter_core/src/domain/entity/common/data_response.dart';

///Custom function to provide request Future
typedef OnRequest<T> = Future<T> Function();

///Custom Function to provide response converter (Map to Object)
typedef OnParse<T> = T Function(dynamic response);

//ignore: one_member_abstracts
abstract class RequestProcessor {
  Future<DataResponse<R>> processRequest<T, R>({
    required OnRequest<T> onRequest,
    required OnParse<R> onParse,
    OnCustomError? onCustomRequestError,
    bool checkNetworkConnection = true,

  });

  @protected
  Future<bool> hasInternetConnection(
    ConnectionChecker connectionChecker,
  ) =>
      Future.value(true);
}

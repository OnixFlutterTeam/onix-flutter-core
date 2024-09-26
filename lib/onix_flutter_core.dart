library onix_flutter_core;

// Local
export 'src/data/local/prefs/base_preferences.dart';
export 'src/data/remote/base/base_api_client.dart' show BaseApiClient;
export 'src/data/remote/base/http_status.dart' show HttpStatus;
export 'src/data/remote/base/map_common_server_error.dart'
    show MapCommonServerError;
export 'src/data/remote/connection_checker/connection_checker.dart';
export 'src/data/remote/dio/api_client.dart' show ApiClient;
export 'src/data/remote/dio/dio_client_module.dart' show DioClientModule;
// Networking
export 'src/data/remote/dio/dio_request_processor/dio_request_processor.dart'
    show DioRequestProcessor, OnRequest, OnResponse;
export 'src/data/remote/dio/dio_request_processor/dio_request_processor_impl.dart';
export 'src/data/remote/dio/interceptor/cache_interceptor.dart';
export 'src/data/remote/dio/params/api_client_params.dart' show ApiClientParams;
export 'src/domain/common/converter/mapper.dart';
// Models
export 'src/domain/entity/common/data_response.dart' show DataResponse;
export 'src/domain/entity/common/operation_status.dart' show OperationStatus;
export 'src/domain/entity/common/result.dart' show Result;

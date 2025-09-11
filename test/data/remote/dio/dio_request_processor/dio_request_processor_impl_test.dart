import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:test/test.dart';

import 'dio_request_processor_impl_test.mocks.dart';

class _MockedException implements Exception {
  const _MockedException();
}

class DefaultApiError {
  final String? name;
  final String? code;

  const DefaultApiError({
    this.name,
    this.code,
  });

  @override
  bool operator ==(Object other) =>
      other is DefaultApiError && name == other.name && code == other.code;

  @override
  int get hashCode => Object.hash(name, code, this);
}

const mockedException = _MockedException();

@GenerateNiceMocks([
  MockSpec<Connectivity>(),
  MockSpec<InternetConnection>(),
])
void main() {
  group('DataResponse error tests', () {
    late RequestProcessor requestProcessor;

    setUp(() {
      requestProcessor = InternalDioRequestProcessor();
    });

    test('DataResponse.undefinedError with non DioExceptionType case',
        () async {
      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        isA<UndefinedError<OperationStatus>>(),
      );
    });

    test('DioExceptionType.connectionTimeout case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          type: DioExceptionType.connectionTimeout,
          message: '',
          requestOptions: RequestOptions(),
          error: '',
        );
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        isA<NoInternetConnection<OperationStatus>>(),
      );
    });

    test('DioExceptionType.sendTimeout case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          type: DioExceptionType.sendTimeout,
          message: '',
          requestOptions: RequestOptions(),
          error: '',
        );
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        isA<NoInternetConnection<OperationStatus>>(),
      );
    });

    test('HttpStatus.networkConnectTimeoutError case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          message: '',
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.networkConnectTimeoutError,
          ),
          error: '',
        );
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        isA<NoInternetConnection<OperationStatus>>(),
      );
    });

    test('HttpStatus.unauthorized case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          message: '',
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.unauthorized,
          ),
          error: '',
        );
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        isA<Unauthorized<OperationStatus>>(),
      );
    });

    test('HttpStatus.tooManyRequests case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          message: '',
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.tooManyRequests,
          ),
          error: '',
        );
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        isA<TooManyRequests<OperationStatus>>(),
      );
    });

    test('HttpStatus.badRequest case', () async {
      final exception = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.badRequest,
          data: {
            'name': 'name',
            'code': 'code',
          },
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw exception;
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
        onCustomRequestError: (code, data) => DefaultApiError(
          name: data['name'],
          code: data['code'],
        ),
      );

      expect(
        result,
        isA<ApiError<OperationStatus>>(),
      );

      expect(
        (result as ApiError<OperationStatus>).statusCode,
        HttpStatus.badRequest,
      );
    });

    test('Empty response body case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.badRequest,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        isA<UndefinedError<OperationStatus>>(),
      );

      expect(
        (result as UndefinedError<OperationStatus>).statusCode,
        HttpStatus.badRequest,
      );
    });

    test('Unexpected ResponseType case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(
            responseType: ResponseType.plain,
          ),
          statusCode: HttpStatus.badRequest,
          data: '',
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result,
        //Need to check
        isA<UndefinedError<OperationStatus>>(),
        //DataResponse<OperationStatus>.undefinedError(mockedException, 400),
      );

      expect(
        (result as UndefinedError<OperationStatus>).statusCode,
        400,
      );
    });

    test('HttpStatus.internalServerError case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.internalServerError,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result1 =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result1,
        isA<UndefinedError<OperationStatus>>(),
      );

      expect(
        (result1 as UndefinedError<OperationStatus>).statusCode,
        HttpStatus.internalServerError,
      );
    });

    test('HttpStatus.serviceUnavailable case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.serviceUnavailable,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result1 =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result1,
        isA<UndefinedError<OperationStatus>>(),
      );

      expect(
        (result1 as UndefinedError<OperationStatus>).statusCode,
        HttpStatus.serviceUnavailable,
      );
    });

    test('HttpStatus.forbidden case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.forbidden,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result1 =
          await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onParse: (_) => OperationStatus.success,
      );

      expect(
        result1,
        isA<UndefinedError<OperationStatus>>(),
      );

      expect(
        (result1 as UndefinedError<OperationStatus>).statusCode,
        HttpStatus.forbidden,
      );
    });

    test('Request is cancelled', () async {
      final cancelToken = CancelToken();
      final fetchDataFuture = Dio().get(
        'https://jsonplaceholder.typicode.com/posts',
        cancelToken: cancelToken,
      );
      cancelToken.cancel('Cancelled by user');
      try {
        await fetchDataFuture;
        fail('Expected DioError to be thrown');
      } catch (e) {
        expect(e, isA<DioException>());
        expect((e as DioException).type, DioExceptionType.cancel);
        expect(e.error, 'Cancelled by user');
      }
    });

    test('Request is cancelled and DataResponse.requestCanceled returned',
        () async {
      final cancelToken = CancelToken();
      final fetchDataFuture = Dio().get(
        'https://jsonplaceholder.typicode.com/posts',
        cancelToken: cancelToken,
      );
      cancelToken.cancel('Cancelled by user');

      final result = await requestProcessor.processRequest(
        onRequest: () => fetchDataFuture,
        onParse: (e) {},
      );
      var failure = false;
      switch (result) {
        case CanceledRequest _:
          {
            failure = true;
            break;
          }
      }

      expect(result.isError(), true);
      expect(failure, true);
    });
  });

  group('HttpStatus.kCodeSuccess tests', () {
    late RequestProcessor requestProcessor;

    setUp(() {
      requestProcessor = InternalDioRequestProcessor();
    });

    test('Success case', () async {
      const mockedData = 'test';

      Future<Response<String>> mockedRequest() {
        return Future<Response<String>>.value(
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.success,
            data: mockedData,
          ),
        );
      }

      final result =
          await requestProcessor.processRequest<Response<String>, String>(
        onRequest: mockedRequest,
        onParse: (response) => response.data,
      );

      expect(
        result,
        isA<DataResponseSuccess>(),
      );

      expect(
        (result as DataResponseSuccess<String>).data,
        'test',
      );
    });
  });

  group('Connectivity && InternetConnectionChecker tests', () {
    late RequestProcessor requestProcessor;
    late Connectivity connectivity;
    late MockInternetConnection internetConnection;
    late ConnectionChecker checker;

    setUp(() {
      connectivity = MockConnectivity();
      internetConnection = MockInternetConnection();
      checker = MobileConnectionChecker(
        connectivity: connectivity,
        internetConnection: internetConnection,
      );
      requestProcessor = InternalDioRequestProcessor(
        connectionChecker: checker,
      );
    });

    test('ConnectivityResult.none test', () async {
      const mockedData = 'test';

      when(connectivity.checkConnectivity()).thenAnswer(
        (_) async => [ConnectivityResult.none],
      );

      when(checker.hasConnection()).thenAnswer(
        (_) async => false,
      );

      Future<Response<String>> mockedRequest() {
        return Future<Response<String>>.value(
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.success,
            data: mockedData,
          ),
        );
      }

      final result =
          await requestProcessor.processRequest<Response<String>, String>(
        onRequest: mockedRequest,
        onParse: (response) => response.data as String,
      );

      expect(result, isA<NoInternetConnection>());
    });

    test('ConnectivityResult.mobile && hasConnection test', () async {
      const mockedData = 'test';

      when(connectivity.checkConnectivity()).thenAnswer(
        (_) async => [ConnectivityResult.mobile],
      );

      when(checker.hasConnection()).thenAnswer(
        (_) async => true,
      );

      Future<Response<String>> mockedRequest() {
        return Future<Response<String>>.value(
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.success,
            data: mockedData,
          ),
        );
      }

      final result =
          await requestProcessor.processRequest<Response<String>, String>(
        onRequest: mockedRequest,
        onParse: (response) => response.data as String,
      );

      expect(result, isA<DataResponseSuccess>());
    });
  });
}

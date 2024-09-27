This package contains some base classes designed to improve experience of using Http networking
functionality.

## Contents

* Custom api client based on Dio
* Custom error handling technics

### Networking

Create a new api client:

```

final dioClientModule = _DioClientModule();
final apiClient = dioClientModule.makeApiClient(
    ApiClientParams(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    defaultConnectTimeout: 5000,
    defaultReceiveTimeout: 5000,
    interceptors: [LogInterceptor()],
    ),
);

```

Create request processor:

```

final processor = dioClientModule.makeDioRequestProcessor();

```

Make a request:

```

onCustomError: (response) {
    final responseType = response?.requestOptions.responseType;
     if (responseType == ResponseType.json) {
        return MyResponse.fromJson(response.data);
    }
    return MyError.unknownError();
}

```

Handle result or error from `DataResponse` class response:

```

if (response.isSuccess()) {
    final data = response.data;
    ...
} else {
    // process and error
}

``` 



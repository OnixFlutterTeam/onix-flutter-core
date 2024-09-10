This package contains some base classes designed to improve experience of using BLoC state management and Http networking functionality.

## Contents

* Custom BLoC implementation
* Custom api client based on Dio
* Custom error handling technics

## Usage

TODO: List prerequisites and provide or point to information on how to
start using the package.

### BLoC (Cubit)

Custom BLoC is a regular BLoC with an additional event type called Single Result. Single Result is designed to call single time function in the UI (like show dialog, navigation, etc.).

Extend you BLoC class from `BaseBloc`:

```
class ExampleScreenBloc extends BaseBloc<BlocEvent,
    BlocState, BlocSR>
```

Extend you widget from `BaseState`

```
class _ExampleScreenState extends BaseState<BlocState,
    ExampleScreenBloc, BlocSR, ExampleScreen> {
```

Create BLoC instance in `createBloc` function: 

```
 ExampleScreenBloc createCubit() => ExampleScreenBloc();
```

Write you widget body in `buildWidget` instead of `build`

```
  @override
  Widget buildWidget(BuildContext context) {
  	return Scaffold(...);
  }
```

Use integrated widgets to handle Single result events or state:

```
srObserver(
	context: context,
    onSR: (BuildContext context, BlocSR sr) {
    ...
    },
    child: Scaffold(...),
);
```

```
blocBuilder(builder: (BuildContext context, BlocState state) {
	return MyWidget(...);
}
```

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
final response = await _dioRequestProcessor.processRequest(
      onRequest: () => _apiClient.client.get('/users'),
      onResponse: (Map<String, dynamic> response) {
        return MyResponse.fromJson(response.data);
      },
      onCustomError: (int code, Map<String, dynamic> data){
        return MyError.fromJson(data);
      }
    );
```

Handle result or error from `DataResponse` class response:

```
if (response.isSuccess()) {
	final data = response.data;
	...
}
else{
	//process and error
}
``` 



This package contains some base classes designed to improve experience of using BLoC state
management and Http networking functionality.

## Contents

* Custom BLoC implementation
* Custom api client based on Dio
* Custom error handling technics

## Usage

TODO: List prerequisites and provide or point to information on how to
start using the package.

### BLoC (Cubit)

Custom BLoC is a regular BLoC with an additional event type called Single Result. Single Result is
designed to call single time function in the UI (like show dialog, navigation, etc.).

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
 ExampleScreenBloc createBloc() => ExampleScreenBloc();
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

or you can override the onSR method:

```
@override
void onSR(
  BuildContext context,
  ExambleBloc bloc,
  BlocSR sr,
) {
  ...
}
```

It is also possible to override the onFailure method to handle failure objects

```
@override
void onFailure(
  BuildContext context,
  ExampleBloc bloc,
  Failure failure,
) {
  ...
}
```

and even onProgress to implement custom progress state behaviour

```
@override
void onProgress(
  BuildContext context,
  ExampleBloc bloc,
  BaseProgressState progress,
) {
  ...
}
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
}
else{
// process and error
}

``` 



// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResponseCopyWith<T, $Res> {
  factory $DataResponseCopyWith(
          DataResponse<T> value, $Res Function(DataResponse<T>) then) =
      _$DataResponseCopyWithImpl<T, $Res, DataResponse<T>>;
}

/// @nodoc
class _$DataResponseCopyWithImpl<T, $Res, $Val extends DataResponse<T>>
    implements $DataResponseCopyWith<T, $Res> {
  _$DataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataResponseSuccessImplCopyWith<T, $Res> {
  factory _$$DataResponseSuccessImplCopyWith(_$DataResponseSuccessImpl<T> value,
          $Res Function(_$DataResponseSuccessImpl<T>) then) =
      __$$DataResponseSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DataResponseSuccessImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$DataResponseSuccessImpl<T>>
    implements _$$DataResponseSuccessImplCopyWith<T, $Res> {
  __$$DataResponseSuccessImplCopyWithImpl(_$DataResponseSuccessImpl<T> _value,
      $Res Function(_$DataResponseSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DataResponseSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DataResponseSuccessImpl<T> extends _DataResponseSuccess<T> {
  const _$DataResponseSuccessImpl(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'DataResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataResponseSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataResponseSuccessImplCopyWith<T, _$DataResponseSuccessImpl<T>>
      get copyWith => __$$DataResponseSuccessImplCopyWithImpl<T,
          _$DataResponseSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DataResponseSuccess<T> extends DataResponse<T> {
  const factory _DataResponseSuccess(final T data) =
      _$DataResponseSuccessImpl<T>;
  const _DataResponseSuccess._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$DataResponseSuccessImplCopyWith<T, _$DataResponseSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UndefinedErrorImplCopyWith<T, $Res> {
  factory _$$UndefinedErrorImplCopyWith(_$UndefinedErrorImpl<T> value,
          $Res Function(_$UndefinedErrorImpl<T>) then) =
      __$$UndefinedErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object? errorObject, int? statusCode});
}

/// @nodoc
class __$$UndefinedErrorImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$UndefinedErrorImpl<T>>
    implements _$$UndefinedErrorImplCopyWith<T, $Res> {
  __$$UndefinedErrorImplCopyWithImpl(_$UndefinedErrorImpl<T> _value,
      $Res Function(_$UndefinedErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorObject = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$UndefinedErrorImpl<T>(
      freezed == errorObject ? _value.errorObject : errorObject,
      freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$UndefinedErrorImpl<T> extends _UndefinedError<T> {
  const _$UndefinedErrorImpl(this.errorObject, [this.statusCode]) : super._();

  @override
  final Object? errorObject;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'DataResponse<$T>.undefinedError(errorObject: $errorObject, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndefinedErrorImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.errorObject, errorObject) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(errorObject), statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UndefinedErrorImplCopyWith<T, _$UndefinedErrorImpl<T>> get copyWith =>
      __$$UndefinedErrorImplCopyWithImpl<T, _$UndefinedErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) {
    return undefinedError(errorObject, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) {
    return undefinedError?.call(errorObject, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) {
    if (undefinedError != null) {
      return undefinedError(errorObject, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) {
    return undefinedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) {
    return undefinedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) {
    if (undefinedError != null) {
      return undefinedError(this);
    }
    return orElse();
  }
}

abstract class _UndefinedError<T> extends DataResponse<T> {
  const factory _UndefinedError(final Object? errorObject,
      [final int? statusCode]) = _$UndefinedErrorImpl<T>;
  const _UndefinedError._() : super._();

  Object? get errorObject;
  int? get statusCode;
  @JsonKey(ignore: true)
  _$$UndefinedErrorImplCopyWith<T, _$UndefinedErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<T, $Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl<T> value, $Res Function(_$ApiErrorImpl<T>) then) =
      __$$ApiErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic error, int? statusCode});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$ApiErrorImpl<T>>
    implements _$$ApiErrorImplCopyWith<T, $Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl<T> _value, $Res Function(_$ApiErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$ApiErrorImpl<T>(
      freezed == error ? _value.error! : error,
      freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ApiErrorImpl<T> extends _ApiError<T> {
  const _$ApiErrorImpl(this.error, [this.statusCode]) : super._();

  @override
  final dynamic error;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'DataResponse<$T>.apiError(error: $error, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<T, _$ApiErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) {
    return apiError(error, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) {
    return apiError?.call(error, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(error, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class _ApiError<T> extends DataResponse<T> {
  const factory _ApiError(final dynamic error, [final int? statusCode]) =
      _$ApiErrorImpl<T>;
  const _ApiError._() : super._();

  dynamic get error;
  int? get statusCode;
  @JsonKey(ignore: true)
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetConnectionImplCopyWith<T, $Res> {
  factory _$$NoInternetConnectionImplCopyWith(
          _$NoInternetConnectionImpl<T> value,
          $Res Function(_$NoInternetConnectionImpl<T>) then) =
      __$$NoInternetConnectionImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoInternetConnectionImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$NoInternetConnectionImpl<T>>
    implements _$$NoInternetConnectionImplCopyWith<T, $Res> {
  __$$NoInternetConnectionImplCopyWithImpl(_$NoInternetConnectionImpl<T> _value,
      $Res Function(_$NoInternetConnectionImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternetConnectionImpl<T> extends _NoInternetConnection<T> {
  const _$NoInternetConnectionImpl() : super._();

  @override
  String toString() {
    return 'DataResponse<$T>.notConnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternetConnectionImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) {
    return notConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) {
    return notConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) {
    return notConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) {
    return notConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected(this);
    }
    return orElse();
  }
}

abstract class _NoInternetConnection<T> extends DataResponse<T> {
  const factory _NoInternetConnection() = _$NoInternetConnectionImpl<T>;
  const _NoInternetConnection._() : super._();
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<T, $Res> {
  factory _$$UnauthorizedImplCopyWith(_$UnauthorizedImpl<T> value,
          $Res Function(_$UnauthorizedImpl<T>) then) =
      __$$UnauthorizedImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$UnauthorizedImpl<T>>
    implements _$$UnauthorizedImplCopyWith<T, $Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl<T> _value, $Res Function(_$UnauthorizedImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedImpl<T> extends _Unauthorized<T> {
  const _$UnauthorizedImpl() : super._();

  @override
  String toString() {
    return 'DataResponse<$T>.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized<T> extends DataResponse<T> {
  const factory _Unauthorized() = _$UnauthorizedImpl<T>;
  const _Unauthorized._() : super._();
}

/// @nodoc
abstract class _$$TooManyRequestsImplCopyWith<T, $Res> {
  factory _$$TooManyRequestsImplCopyWith(_$TooManyRequestsImpl<T> value,
          $Res Function(_$TooManyRequestsImpl<T>) then) =
      __$$TooManyRequestsImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TooManyRequestsImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$TooManyRequestsImpl<T>>
    implements _$$TooManyRequestsImplCopyWith<T, $Res> {
  __$$TooManyRequestsImplCopyWithImpl(_$TooManyRequestsImpl<T> _value,
      $Res Function(_$TooManyRequestsImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TooManyRequestsImpl<T> extends _TooManyRequests<T> {
  const _$TooManyRequestsImpl() : super._();

  @override
  String toString() {
    return 'DataResponse<$T>.tooManyRequests()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TooManyRequestsImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) {
    return tooManyRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) {
    return tooManyRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) {
    return tooManyRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) {
    return tooManyRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests(this);
    }
    return orElse();
  }
}

abstract class _TooManyRequests<T> extends DataResponse<T> {
  const factory _TooManyRequests() = _$TooManyRequestsImpl<T>;
  const _TooManyRequests._() : super._();
}

/// @nodoc
abstract class _$$CanceledRequestImplCopyWith<T, $Res> {
  factory _$$CanceledRequestImplCopyWith(_$CanceledRequestImpl<T> value,
          $Res Function(_$CanceledRequestImpl<T>) then) =
      __$$CanceledRequestImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CanceledRequestImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$CanceledRequestImpl<T>>
    implements _$$CanceledRequestImplCopyWith<T, $Res> {
  __$$CanceledRequestImplCopyWithImpl(_$CanceledRequestImpl<T> _value,
      $Res Function(_$CanceledRequestImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CanceledRequestImpl<T> extends _CanceledRequest<T> {
  const _$CanceledRequestImpl() : super._();

  @override
  String toString() {
    return 'DataResponse<$T>.canceledRequest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CanceledRequestImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject, int? statusCode)
        undefinedError,
    required TResult Function(dynamic error, int? statusCode) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
    required TResult Function() canceledRequest,
  }) {
    return canceledRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult? Function(dynamic error, int? statusCode)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
    TResult? Function()? canceledRequest,
  }) {
    return canceledRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject, int? statusCode)? undefinedError,
    TResult Function(dynamic error, int? statusCode)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    TResult Function()? canceledRequest,
    required TResult orElse(),
  }) {
    if (canceledRequest != null) {
      return canceledRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
    required TResult Function(_CanceledRequest<T> value) canceledRequest,
  }) {
    return canceledRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult? Function(_CanceledRequest<T> value)? canceledRequest,
  }) {
    return canceledRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    TResult Function(_CanceledRequest<T> value)? canceledRequest,
    required TResult orElse(),
  }) {
    if (canceledRequest != null) {
      return canceledRequest(this);
    }
    return orElse();
  }
}

abstract class _CanceledRequest<T> extends DataResponse<T> {
  const factory _CanceledRequest() = _$CanceledRequestImpl<T>;
  const _CanceledRequest._() : super._();
}

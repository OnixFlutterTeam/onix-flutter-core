import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/src/data/remote/connection_checker/connection_checker.dart';
import 'package:onix_flutter_core/src/data/remote/connection_checker/connectivity_ext.dart';

class ConnectionCheckerImpl implements ConnectionChecker {
  final Connectivity _connectivity = Connectivity();

  static final ConnectionCheckerImpl _instance = ConnectionCheckerImpl._();

  ConnectionCheckerImpl._();

  factory ConnectionCheckerImpl.createInstance({
    List<ConnectionOption> options = const [],
    bool useDefaultOptionsOnly = true,
  }) {
    _instance._currentOptions = [
      ..._instance._defaultOptions,
      if (!useDefaultOptionsOnly) ...options,
    ];
    return _instance;
  }

  List<ConnectionOption> _currentOptions = [];

  final List<ConnectionOption> _defaultOptions = [
    ConnectionOption(
      uri: Uri.parse('https://google.com/'),
    ),
    ConnectionOption(
      uri: Uri.parse('https://apple.com/'),
    ),
    ConnectionOption(
      uri: Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    ),
  ];

  @override
  Future<bool> hasConnection() async {
    final connectionResult = await _connectivity.checkConnectivity();
    final isAnyResourceReachable = await _isAnyResourceReachable();
    return connectionResult.hasConnection && isAnyResourceReachable;
  }

  Future<bool> _isAnyResourceReachable() async {
    final Completer<bool> completer = Completer<bool>();
    int length = _currentOptions.length;

    for (final option in _currentOptions) {
      unawaited(
        _checkResourceAvailability(option).then((result) {
          length -= 1;

          if (completer.isCompleted) return;

          if (result) {
            completer.complete(true);
          } else if (length == 0) {
            completer.complete(false);
          }
        }),
      );
    }

    return completer.future;
  }

  Future<bool> _checkResourceAvailability(ConnectionOption option) async {
    return compute(
      (_) async {
        try {
          await Dio(
            BaseOptions(
              headers: option.headers,
              baseUrl: option.uri.toString(),
              connectTimeout: option.connectTimeout,
              receiveTimeout: option.receiveTimeout,
            ),
          ).headUri(option.uri);
          return true;
        } catch (_) {
          return false;
        }
      },
      null,
    );
  }
}

class ConnectionOption {
  final Uri uri;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Map<String, String> headers;

  const ConnectionOption({
    required this.uri,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.headers = const {},
  });

  @override
  String toString() {
    return 'ConnectionOptions(\n'
        '  uri: $uri,\n'
        '  connectTimeout: $connectTimeout,\n'
        '  receiveTimeout: $receiveTimeout,\n'
        '  headers: $headers\n'
        ')';
  }
}

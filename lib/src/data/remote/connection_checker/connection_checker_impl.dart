import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core/src/data/remote/connection_checker/connectivity_ext.dart';

class ConnectionCheckerImpl implements ConnectionChecker {
  final InternetConnection _connection;
  final Connectivity _connectivity;

  const ConnectionCheckerImpl({
    required InternetConnection connection,
    required Connectivity connectivity,
  })  : _connection = connection,
        _connectivity = connectivity;

  @override
  Future<bool> hasConnection() async {
    final hasAccess = await _connection.hasInternetAccess;
    final connectivityResult = await _connectivity.checkConnectivity();
    return hasAccess && connectivityResult.hasConnection;
  }
}

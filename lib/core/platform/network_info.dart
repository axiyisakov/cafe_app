import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract interface class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl({required this.connectionChecker});
  @override
  Future<bool> isConnected() {
    return connectionChecker.hasConnection;
  }
}

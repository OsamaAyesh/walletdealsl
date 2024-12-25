import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  // Pass the InternetConnectionChecker instance via constructor
  NetworkInfo({InternetConnectionChecker? connectionChecker})
      : _connectionChecker = connectionChecker ?? InternetConnectionChecker.createInstance();

  Future<bool> isConnected() async {
    bool result = await _connectionChecker.hasConnection;
    if (result) {
      print('Connected to the internet');
    } else {
      print('No internet connection');
    }
    return result;
  }
}

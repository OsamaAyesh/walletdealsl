import 'package:internet_connection_checker/internet_connection_checker.dart';

/// A utility class to check network connectivity
class NetworkInfo {
  /// Instance of InternetConnectionChecker to check internet status
  final InternetConnectionChecker _connectionChecker;

  /// Constructor with dependency injection support
  NetworkInfo({InternetConnectionChecker? connectionChecker})
      : _connectionChecker = connectionChecker ?? InternetConnectionChecker.createInstance();

  /// Checks if the device is connected to the internet
  /// Returns `true` if connected, `false` otherwise
  Future<bool> isConnected() async {
    try {
      final bool isConnected = await _connectionChecker.hasConnection;
      _logConnectionStatus(isConnected);
      return isConnected;
    } catch (e, stackTrace) {
      // Log the error and return false
      print('Error checking internet connection: $e');
      print(stackTrace);
      return false;
    }
  }

  /// Logs the connection status to the console or a logger
  void _logConnectionStatus(bool isConnected) {
    if (isConnected) {
      print('Connected to the internet');
    } else {
      print('No internet connection');
    }
  }
}

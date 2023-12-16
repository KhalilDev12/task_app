import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  Stream<ConnectivityResult> get onConnectivityChanged =>
      Connectivity().onConnectivityChanged;

  Future<bool> checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}

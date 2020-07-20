
import 'package:connectivity/connectivity.dart';

class NetworkUtil {

  static Future<bool> isOnline() async {
    final connect = await Connectivity().checkConnectivity();
    if (connect == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

}
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  static const googleUrl = 'google.com';

  static Future<bool> get isInternetConnected async {
    try {
      final result = await Connectivity().checkConnectivity();

      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        final result = await InternetAddress.lookup(googleUrl);
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}

import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class AppInfoUtils {
  static Future<String> get currentVersion async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static String get deviceType => Platform.isAndroid ? 'android' : 'ios';

  static String get platform => Platform.isAndroid ? 'APP_ANDROID' : 'APP_IOS';
}

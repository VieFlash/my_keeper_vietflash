import 'package:injectable/injectable.dart';

import '../../../../domain/local/pref/app_pref.dart';

@injectable
class SplashController {
  SplashController(
      this._pref,
      );

  final AppPref _pref;

  final isLoading = false;
  var isLoggedIn = false;

  Future<void> loadLocal() async {
    isLoggedIn = (await _pref.accessToken).isNotEmpty;
  }
}

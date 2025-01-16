import 'package:injectable/injectable.dart';
import 'package:my_keeper_vietflash/domain/local/pref/app_pref.dart';

import '../../config/log/log.dart';

@Singleton()
class CommonServices {
  CommonServices(this._pref);

  final AppPref _pref;

  String accessToken = "";

  Future<void> initialData() async {
    await loadData();
  }

  Future<void> loadData() async {
    await getAccessToken();
  }

  Future<void> getAccessToken() async {
    accessToken = await _pref.accessToken;
    Log.d("VietTD message error common: ${accessToken}");
  }
}

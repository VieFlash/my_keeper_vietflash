import 'package:injectable/injectable.dart';
import 'package:my_keeper_vietflash/domain/local/pref/app_pref.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';

import '../../utils/data_constants.dart';

@Singleton(as: AppPref)
class AppPrefImpl extends AppPref {
  final NativeSharedPreferences _preferences;

  AppPrefImpl(this._preferences);

  @override
  Future<void> setAccessToken(String accessToken) async {
    _preferences.setString(DataConstants.preferences.accessToken, accessToken) ?? '';
  }

  @override
  Future<void> setUserId(String userId) async {
    await _preferences.setString(DataConstants.preferences.userId, userId);
  }

  @override
  Future<void> setUserName(String userName) async {
    await _preferences.setString(DataConstants.preferences.userName, userName);
  }

  @override
  Future<String> get userId async {
    return _preferences.getString(DataConstants.preferences.userId) ?? '';
  }

  @override
  Future<String> get accessToken async =>
      _preferences.getString(DataConstants.preferences.accessToken) ?? '';

  @override
  Future<String> get userName async =>
      _preferences.getString(DataConstants.preferences.userName) ?? '';
}

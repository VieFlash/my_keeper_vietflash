abstract class AppPref{
  Future<void> setUserId(String userId);

  Future<String> get userId;

  Future<void> setAccessToken(String accessToken);

  Future<String> get accessToken;

  Future<String> get userName;

  Future<void> setUserName(String userName);
}
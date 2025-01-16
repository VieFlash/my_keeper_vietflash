import 'dart:ui';

class DataConstants {
  static const sizeUIDesign = Size(375, 667);
  static final statusCode = StatusCode();
  static final preferences = Preferences();

  /// API Paths
  static const login = 'login';
}

class StatusCode {
  int get success => 200;

  int get created => 201;

  int get unauthorized => 401;

  int get forbidden => 403;

  int get notFound => 404;

  int get dataInvalid => 422;

  int get server => 500;
}

class Preferences {
  String get userId => 'userId';

  String get accessToken => 'accessToken';

  String get userName => 'userName';
}

import 'package:json_annotation/json_annotation.dart';

import '../../model/user_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'user')
  UserModel user;

  @JsonKey(name: 'token')
  String accessToken;

  LoginResponse(
    this.user,
    this.accessToken,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

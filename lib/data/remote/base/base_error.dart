import 'package:json_annotation/json_annotation.dart';

part 'base_error.g.dart';

@JsonSerializable()
class BaseError {
  const BaseError({
    this.message,
    this.code,
    this.url,
    this.forceUpdate,
    this.authWrong,
    this.email,
  });

  final String? message;
  final String? url;
  final String? code;
  @JsonKey(name: 'force_update')
  final int? forceUpdate;

  @JsonKey(name: 'auth_wrong')
  final List<String>? authWrong;

  @JsonKey(name: 'email')
  final List<String>? email;

  factory BaseError.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorFromJson(json);

  Map<String, dynamic> toJson() => _$BaseErrorToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseError _$BaseErrorFromJson(Map<String, dynamic> json) => BaseError(
      message: json['message'] as String?,
      code: json['code'] as String?,
      url: json['url'] as String?,
      forceUpdate: (json['force_update'] as num?)?.toInt(),
      authWrong: (json['auth_wrong'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BaseErrorToJson(BaseError instance) => <String, dynamic>{
      'message': instance.message,
      'url': instance.url,
      'code': instance.code,
      'force_update': instance.forceUpdate,
      'auth_wrong': instance.authWrong,
      'email': instance.email,
    };

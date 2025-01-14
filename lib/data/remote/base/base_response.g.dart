// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) =>
    BaseResponse<T>(
      status: json['status'],
      errors: json['errors'] == null
          ? null
          : BaseError.fromJson(json['errors'] as Map<String, dynamic>),
      message: json['message'] as String?,
      data: BaseConverter<T?>().fromJson(json['data']),
    );

Map<String, dynamic> _$BaseResponseToJson<T>(BaseResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errors': instance.errors,
      'message': instance.message,
      'data': _$JsonConverterToJson<dynamic, T>(
          instance.data, BaseConverter<T?>().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

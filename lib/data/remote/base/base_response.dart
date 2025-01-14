import 'package:json_annotation/json_annotation.dart';

import 'base_conveter.dart';
import 'base_error.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse<T> {
  const BaseResponse({
    this.status,
    this.errors,
    this.message,
    this.data,
  });

  final dynamic status;
  final BaseError? errors;
  final String? message;

  @BaseConverter()
  final T? data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

}

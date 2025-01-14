import 'dart:convert';

import 'package:dio/dio.dart';

import '../../common/services/common_services.dart';
import '../../config/di/app_module.dart';
import '../../domain/local/pref/app_pref.dart';
import '../../utils/info/app_info_utils.dart';
import '../remote/base/base_response.dart';
import 'data_constants.dart';

class AuthInterceptor extends QueuedInterceptor {
  String? accessToken;
  bool shouldRetry = true;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    //accessToken = await serviceLocator<GetTokenUseCase>().call();
    final deviceType = AppInfoUtils.deviceType;
    final currentVersion = await AppInfoUtils.currentVersion;

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['deviceType'] = deviceType;
    options.headers['version'] = currentVersion;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    var rawResponse = response.data;
    var rawRequest = response.requestOptions.data;
    try {
      var jsonRequest = jsonEncode(rawRequest);
      if (rawResponse is String && rawResponse.startsWith(jsonRequest)) {
        response.data = jsonDecode(rawResponse.replaceFirst(jsonRequest, ""));
      }
    } finally {}

    final commonService = serviceLocator<CommonServices>();
    //final pref = serviceLocator<AppPref>();
    final data = BaseResponse.fromJson(response.data);

    if (response.statusCode != DataConstants.statusCode.forbidden &&
        response.statusCode != DataConstants.statusCode.unauthorized) {
      shouldRetry = true;
      handler.next(response);
      return;
    }

    handler.next(response);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  Future onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) async {
    handler.next(await _commonResponse(response));
  }

  Future<Response> _commonResponse(Response response) async {
    if (response.statusCode == DataConstants.statusCode.unauthorized ||
        response.statusCode == DataConstants.statusCode.forbidden ||
        response.statusCode == DataConstants.statusCode.notFound ||
        response.statusCode == DataConstants.statusCode.dataInvalid ||
        response.statusCode == DataConstants.statusCode.server) {}
    return response;
  }
}

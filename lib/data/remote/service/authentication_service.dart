import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/data_constants.dart';
import '../base/base_response.dart';
import '../request/login_request.dart';
import '../response/login_response.dart';

part 'authentication_service.g.dart';

@RestApi()
@Singleton()
abstract class AuthenticationService {
  @factoryMethod
  factory AuthenticationService(Dio dio) = _AuthenticationService;

  @POST(DataConstants.login)
  Future<BaseResponse<LoginResponse>> login(@Body() LoginRequest request);
}

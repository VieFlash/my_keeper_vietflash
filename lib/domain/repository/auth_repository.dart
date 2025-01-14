import 'package:either_dart/either.dart';
import 'package:my_keeper_vietflash/data/remote/base/base_error.dart';
import 'package:my_keeper_vietflash/data/remote/request/login_request.dart';
import 'package:my_keeper_vietflash/data/remote/response/login_response.dart';

abstract class AuthRepository {
  Future<Either<BaseError, LoginResponse?>> login(LoginRequest request);
}
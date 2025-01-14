import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:my_keeper_vietflash/data/remote/base/base_error.dart';
import 'package:my_keeper_vietflash/data/remote/request/login_request.dart';
import 'package:my_keeper_vietflash/data/remote/response/login_response.dart';
import 'package:my_keeper_vietflash/data/remote/service/authentication_service.dart';
import '../../domain/repository/auth_repository.dart';
import '../remote/base/api_call.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthenticationService _authenticationService;

  AuthRepositoryImpl(this._authenticationService);

  @override
  Future<Either<BaseError, LoginResponse?>> login(LoginRequest request) async {
    return await safeApiCall<LoginResponse>(
        () => _authenticationService.login(request));
  }
}

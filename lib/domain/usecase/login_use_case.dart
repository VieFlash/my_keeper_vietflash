import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:my_keeper_vietflash/data/remote/base/base_error.dart';
import 'package:my_keeper_vietflash/data/remote/request/login_request.dart';
import 'package:my_keeper_vietflash/data/remote/response/login_response.dart';
import 'package:my_keeper_vietflash/domain/repository/auth_repository.dart';
import 'package:my_keeper_vietflash/domain/usecase/usecase.dart';

@injectable
class LoginUseCase
    extends ParamUseCase<Either<BaseError, LoginResponse?>, LoginRequest> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<BaseError, LoginResponse?>> call(LoginRequest param) async {
    return await _repository.login(param);
  }
}

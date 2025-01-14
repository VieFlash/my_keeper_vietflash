import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_keeper_vietflash/data/remote/request/login_request.dart';
import 'package:my_keeper_vietflash/domain/usecase/login_use_case.dart';
import 'package:my_keeper_vietflash/presentation/views/login_view/bloc/login_event.dart';
import 'package:my_keeper_vietflash/presentation/views/login_view/bloc/login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase) : super(LoginStateInitial()) {
    on<LoginEventLogin>(_login);
  }

  final LoginUseCase _loginUseCase;

  Future<void> _login(LoginEventLogin event, Emitter<LoginState> emit) async {
    emit(LoginStateLoading());

    final request = LoginRequest(event.email, event.password);
    final res = await _loginUseCase.call(request);
    if (res.isRight) {
      emit(LoginStateSuccess());
    } else {
      emit(LoginStateError());
    }
  }
}

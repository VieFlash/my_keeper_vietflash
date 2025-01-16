import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_keeper_vietflash/data/remote/request/login_request.dart';
import 'package:my_keeper_vietflash/domain/usecase/login_use_case.dart';
import 'package:my_keeper_vietflash/presentation/views/login_view/bloc/login_event.dart';
import 'package:my_keeper_vietflash/presentation/views/login_view/bloc/login_state.dart';

import '../../../../config/log/log.dart';
import '../../../../domain/local/pref/app_pref.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase, this._prefs) : super(LoginStateInitial()) {
    on<LoginEventLogin>(_login);
  }

  final AppPref _prefs;
  final LoginUseCase _loginUseCase;

  String messageError = '';

  Future<void> _login(LoginEventLogin event, Emitter<LoginState> emit) async {
    emit(LoginStateLoading());

    final request = LoginRequest(event.email, event.password);
    final res = await _loginUseCase.call(request);
    if (res.isRight) {
      final data = res.right;
      await _prefs.setUserId(data?.user.id.toString() ?? '');
      await _prefs.setUserName(data?.user.name.toString() ?? '');
      await _prefs.setAccessToken(data?.accessToken ?? '');
      emit(LoginStateSuccess());
    } else {
      final error = res.left;
      messageError = error.authWrong?.first ?? '';
      emit(LoginStateError());
    }
  }
}

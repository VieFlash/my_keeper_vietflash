import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_keeper_vietflash/config/router/routers/home_router.dart';
import 'package:my_keeper_vietflash/presentation/views/login_view/bloc/login_event.dart';

import '../../../common/res/colors.dart';
import '../../../common/res/dimens.dart';
import '../../../config/di/app_module.dart';
import '../../../config/log/log.dart';
import '../../../config/router/utils/navigator_utils.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_dialog.dart';
import '../../widgets/common_gaps.dart';
import '../../widgets/common_loading_dialogs.dart';
import '../../widgets/common_text_field.dart';
import '../../widgets/common_text_styles.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginBloc = serviceLocator<LoginBloc>();

  final _loginEmailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (_, state) {
          if (state is LoginStateLoading) {
            showLoadingDialog(context);
          }
          hideLoadingDialog(context);

          if (state is LoginStateError) {
            showIOSDialog(
              title: _loginBloc.messageError,
              firstButtonText: 'OK',
              firstButtonCallback: () {
                Navigator.of(context).pop();
              },
              context: context,
            );
          }
          if (state is LoginStateSuccess) {
            HomeRouter.goMainView(context);
          }
        },
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: () {
        NavigatorUtils.unFocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DimensRes.sp20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.vGap80,
                  CommonTextField(
                    controller: _loginEmailCtrl,
                    borderColor: ColorsRes.borderGray,
                    inputTextStyle: CommonTextStyles.primary.copyWith(
                      color: ColorsRes.black,
                    ),
                    labelText: 'Email',
                    borderRadius: BorderRadius.circular(DimensRes.sp6),
                    backgroundColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    errorText: "",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: DimensRes.sp16, horizontal: DimensRes.sp12),
                    borderWidth: DimensRes.sp2,
                    errorStyle: CommonTextStyles.medium.copyWith(
                      fontSize: DimensRes.sp13,
                      color: ColorsRes.errorText,
                      height: DimensRes.sp1_5,
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Gaps.vGap20,
                  CommonTextField(
                    controller: _passwordCtrl,
                    inputTextStyle: CommonTextStyles.primary.copyWith(
                      color: ColorsRes.black,
                    ),
                    labelText: 'Password',
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(DimensRes.sp6),
                    obscureText: true,
                    borderColor: ColorsRes.borderGray,
                    errorText: "",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: DimensRes.sp16, horizontal: DimensRes.sp12),
                    borderWidth: DimensRes.sp2,
                    errorStyle: CommonTextStyles.medium.copyWith(
                      fontSize: DimensRes.sp13,
                      color: ColorsRes.errorText,
                      height: DimensRes.sp1_5,
                    ),
                  ),
                  Gaps.vGap20,
                  CommonButton(
                    onPressed: () {
                      _loginBloc.add(LoginEventLogin(
                          email: _loginEmailCtrl.text,
                          password: _passwordCtrl.text));
                    },
                    title: "Login",
                    backgroundColor: ColorsRes.black,
                    borderRadius: DimensRes.sp30,
                    textStyle: CommonTextStyles.bold.copyWith(
                      color: ColorsRes.white,
                      fontSize: DimensRes.sp16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

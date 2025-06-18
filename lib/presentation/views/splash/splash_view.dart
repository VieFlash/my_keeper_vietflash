import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_keeper_vietflash/common/base/base_mixin.dart';
import '../../../common/res/colors.dart';

import '../../../config/router/routers/home_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with BaseMixin{

  Future<void> loadLocal() async {
    /*bool isLoggedIn = (await _pref.accessToken).isNotEmpty;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (isLoggedIn) {
        HomeRouter.goMainView(context);
      } else {
        HomeRouter.goLogin(context);
      }
      FlutterNativeSplash.remove();
    });*/
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      HomeRouter.goMainView(context);
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorsRes.primary,
        ),
      ),
    );
  }
}

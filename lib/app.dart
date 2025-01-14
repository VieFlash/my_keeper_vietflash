import 'package:flutter/material.dart';
import 'package:my_keeper_vietflash/presentation/views/login_view/login_view.dart';

import 'common/res/themes.dart';
import 'config/di/app_module.dart';
import 'config/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Themes.commonThemeData(context),
        debugShowCheckedModeBanner: false,
        home: const LoginView());
  }
}

Future<void> configureApp() async {
  // Init di
  await configureDependencies();

  // Init routes
  await configureRouters();
}

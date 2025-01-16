import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_keeper_vietflash/presentation/views/splash/splash_view.dart';

import 'common/res/themes.dart';
import 'config/di/app_module.dart';
import 'config/router/router.dart';
import 'data/utils/data_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DataConstants.sizeUIDesign,
      minTextAdapt: false,
      splitScreenMode: true,
      child: MaterialApp(
          theme: Themes.commonThemeData(context),
          debugShowCheckedModeBanner: false,
          home: const SplashView()),
    );
  }
}

Future<void> configureApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Init di
  await configureDependencies();

  // Init routes
  await configureRouters();
}

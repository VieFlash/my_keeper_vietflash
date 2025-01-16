import 'package:fluro/fluro.dart';
import 'package:my_keeper_vietflash/config/router/utils/navigator_paths.dart';
import 'package:my_keeper_vietflash/config/router/utils/navigator_utils.dart';
import 'package:my_keeper_vietflash/config/router/utils/router_provider.dart';
import 'package:my_keeper_vietflash/presentation/views/login_view/login_view.dart';
import 'package:my_keeper_vietflash/presentation/views/main_view/main_view.dart';

class HomeRouter extends IRouterProvider {
  @override
  void defineRoutes(FluroRouter router) {
    router.define(NavigatorPaths.login,
        handler: Handler(handlerFunc: (context, __) {
      return const LoginView();
    }));

    router.define(NavigatorPaths.main,
        handler: Handler(handlerFunc: (context, __) {
      return const MainView();
    }));
  }

  static void goLogin(context) {
    NavigatorUtils.pushAndRemoveUntil(
      context,
      NavigatorPaths.login,
      rootNavigator: true,
      transition: TransitionType.native,
    );
  }

  static void goMainView(context) {
    NavigatorUtils.push(context, NavigatorPaths.main);
  }
}

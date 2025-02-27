import 'package:flutter/material.dart';
import 'package:my_keeper_vietflash/common/base/base_mixin.dart';
import 'package:my_keeper_vietflash/presentation/views/analytics_view/analytics_view.dart';
import 'package:my_keeper_vietflash/presentation/views/main_view/main_view.dart';
import 'package:my_keeper_vietflash/presentation/views/more_view/more_view.dart';
import 'package:my_keeper_vietflash/presentation/views/notebook_view/notebook_view.dart';
import 'package:my_keeper_vietflash/presentation/views/wallet_view/wallet_view.dart';

import '../../../common/res/colors.dart';
import '../../../config/router/ui/page_not_found.dart';
import '../../../config/router/utils/navigator_paths.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseMixin, SingleTickerProviderStateMixin {

  @override
  void deactivate() {
    _goHomeRoot();
    super.deactivate();
  }

  void _goHomeRoot() {
    homeBookNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(NavigatorPaths.notebook, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.white,
      body: SafeArea(
        child: Navigator(
          key: homeBookNavigatorKey,
          initialRoute: NavigatorPaths.notebook,
          onGenerateRoute: (settings) {
            late Widget page;
            switch (settings.name) {
              case NavigatorPaths.notebook:
                page = const NotebookView();
                break;
              case NavigatorPaths.wallet:
                page = const WalletView();
                break;
              case NavigatorPaths.analytics:
                page = const AnalyticsView();
                break;
              case NavigatorPaths.more:
                page = const MoreView();
                break;
              default:
                page = const PageNotFound();
            }

            if (settings.name == NavigatorPaths.notebook) {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => page,
                settings: settings,
              );
            }

            return MaterialPageRoute(
              builder: (context) {
                return page;
              },
              settings: settings,
            );
          },
        ),
      ),
    );
  }
}

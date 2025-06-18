import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_keeper_vietflash/common/base/base_mixin.dart';
import 'package:my_keeper_vietflash/presentation/views/main_view/widgets/common_tab_navigator.dart';

import '../../../common/constants/assets.dart';
import '../../../common/enums/bottom_nav.dart';
import '../../../common/res/colors.dart';
import '../../../common/res/dimens.dart';
import '../../../config/router/utils/navigator_paths.dart';
import '../../../generated/l10n.dart';
import '../../widgets/common_text_styles.dart';

final homeBookNavigatorKey = GlobalKey<NavigatorState>();
final walletNavigatorKey = GlobalKey<NavigatorState>();
final analyticsNavigatorKey = GlobalKey<NavigatorState>();
final moreNavigatorKey = GlobalKey<NavigatorState>();

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with BaseMixin {
  late BottomNavItem _currentNavItem;
  final _navigatorKeys = {
    BottomNavItem.home: GlobalKey<NavigatorState>(),
    BottomNavItem.wallet: GlobalKey<NavigatorState>(),
    BottomNavItem.analytics: GlobalKey<NavigatorState>(),
    BottomNavItem.more: GlobalKey<NavigatorState>(),
  };
  final _navigatorObservers = {
    BottomNavItem.home: CommonNavigatorObserver(),
    BottomNavItem.wallet: CommonNavigatorObserver(),
    BottomNavItem.analytics: CommonNavigatorObserver(),
    BottomNavItem.more: CommonNavigatorObserver(),
  };

  Future<void> initialData() async {}

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _currentNavItem = BottomNavItem.home;

    initialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.gray200,
      body: Stack(
        children: [
          _buildOffstageNavigator(BottomNavItem.home),
          _buildOffstageNavigator(BottomNavItem.wallet),
          _buildOffstageNavigator(BottomNavItem.analytics),
          _buildOffstageNavigator(BottomNavItem.more),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildOffstageNavigator(BottomNavItem navItem) {
    return Offstage(
      offstage: _currentNavItem != navItem,
      child: CommonTabNavigator(
        navigatorKey: _navigatorKeys[navItem]!,
        navigatorObserver: _navigatorObservers[navItem]!,
        initialRoute: _getInitialRoute(navItem),
      ),
    );
  }

  String _getInitialRoute(BottomNavItem navItem) {
    switch (navItem) {
      case BottomNavItem.home:
        return NavigatorPaths.home;
      case BottomNavItem.wallet:
        return NavigatorPaths.wallet;
      case BottomNavItem.analytics:
        return NavigatorPaths.analytics;
      case BottomNavItem.more:
        return NavigatorPaths.more;
    }
  }

  Widget _buildBottomBar() {
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: DimensRes.sp60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: ColorsRes.primary.withOpacity(0.1),
                      blurRadius: DimensRes.sp1,
                      offset: const Offset(1, 0))
                ],
              ),
              child: Row(
                children: [
                  _buildBottomBarItem(
                    navItem: BottomNavItem.home,
                    icon: Assets.noteBookIcon,
                    label: S.current.notebook,
                  ),
                  _buildBottomBarItem(
                    navItem: BottomNavItem.wallet,
                    icon: Assets.walletIcon,
                    label: S.current.wallet,
                  ),
                  _buildBottomBarItem(
                    navItem: BottomNavItem.analytics,
                    icon: Assets.analyticsIcon,
                    label: S.current.analytics,
                  ),
                  _buildBottomBarItem(
                    navItem: BottomNavItem.more,
                    icon: Assets.moreIcon,
                    label: S.current.more,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarItem({
    required BottomNavItem navItem,
    required String icon,
    required String label,
  }) {
    bool isActive = _currentNavItem == navItem;
    return Container(
      color: ColorsRes.primary,
      alignment: Alignment.center,
      width: ScreenUtil().screenWidth / 4,
      height: DimensRes.sp60,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _onNavItemSelected(navItem);
          },
          borderRadius: BorderRadius.circular(50),
          splashColor: ColorsRes.black.withOpacity(0.2),
          child: Ink(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: DimensRes.sp73),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: DimensRes.sp26,
                    margin: const EdgeInsets.only(
                        top: DimensRes.sp6,
                        right: DimensRes.sp11,
                        left: DimensRes.sp11),
                    child: Image.asset(
                      icon,
                      height: DimensRes.sp15,
                    ),
                  ),
                  Text(
                    label,
                    style: CommonTextStyles.smallBold.copyWith(
                      fontSize: DimensRes.sp11,
                      height: DimensRes.sp1_448,
                      color: isActive ? ColorsRes.black : ColorsRes.darkGray,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onNavItemSelected(BottomNavItem navItem) {
    final routeStacks = _navigatorObservers[_currentNavItem]!.routeStacks;

    /*if (_currentNavItem == navItem &&
        routeStacks.length > 2 &&
        _currentNavItem != BottomNavItem.profile &&
        _currentNavItem != BottomNavItem.home) {
      _navigatorKeys[navItem]!.currentState?.popUntil(
              (route) => route.settings.name == routeStacks[1].settings.name);
    } else {
      _navigateToTop(_currentNavItem);
    }*/
    setState(() => _currentNavItem = navItem);
  }
}

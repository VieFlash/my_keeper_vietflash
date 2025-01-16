import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_keeper_vietflash/common/base/base_mixin.dart';
import 'package:my_keeper_vietflash/config/di/app_module.dart';

import '../../../common/services/common_services.dart';
import '../../../config/log/log.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with BaseMixin {
  final _commonService = serviceLocator<CommonServices>();

  Future<void> initialData() async {
    await _commonService.initialData();
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(child: Text("Main view: ${_commonService.accessToken}"),),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../presentation/widgets/common_gaps.dart';

abstract class LifecycleWatcherState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Gaps.empty;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  void onResumed();
}

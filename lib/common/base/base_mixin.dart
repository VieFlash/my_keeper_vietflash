import 'package:flutter/material.dart';

import '../../config/log/log.dart';
import '../../presentation/widgets/common_loading_dialogs.dart';
import '../../utils/network/network_utils.dart';

mixin BaseMixin<T extends StatefulWidget> on State<T> {
  Future<void> doEvent(Function() function) async {
    final hasConnection = await NetworkUtils.isInternetConnected;

    if (!hasConnection) {
      return;
    }

    await function.call();
  }

  Widget loadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  void hideLoadingProgress() {
    hideLoadingDialog(context);
  }

  void showLoadingProgress() {
    showLoadingDialog(context);
  }

  @override
  void didChangeDependencies() {
    Log.d('$T ==> didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Log.d('$T ==> dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    Log.d('$T ==> deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    Log.d('$T ==> didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    Log.d('$T ==> initState');
    super.initState();
  }

  void showErrorDialog({
    Widget? content,
    String? title,
    Function()? onClick,
    bool dismissible = true,
  }) {
    /*showCommonDialog(
      dismissible: dismissible,
      firstButtonCallback: onClick ??
              () {
            Get.back();
          },
      firstButtonText: S.current.button_ok,
      title: title,
      content: content,
    );*/
  }
}

import 'dart:ui';

mixin SafeClick {
  static const double defaultInterval = 500;
  int lastTimeClicked = 0;

  void onSafeClickListener({VoidCallback? callback}) {
    if (DateTime.now().millisecondsSinceEpoch - lastTimeClicked <
        defaultInterval) {
      return;
    }
    lastTimeClicked = DateTime.now().millisecondsSinceEpoch;
    if (callback != null) {
      callback();
    }
  }
}

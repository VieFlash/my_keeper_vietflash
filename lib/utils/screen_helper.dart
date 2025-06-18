import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/res/dimens.dart';
import '../config/log/log.dart';

class ScreenHelper {
  static final ScreenHelper _instance = ScreenHelper._internal();

  factory ScreenHelper() {
    return _instance;
  }

  ScreenHelper._internal() {
    isLagerScreen = ScreenUtil().screenWidth > _defaultLagerWidth;
    isSmallScreen = ScreenUtil().screenWidth <= _defaultSmallWidth;
    width = isLagerScreen ? _defaultLagerWidth : ScreenUtil().screenWidth;
    widthInfinity = isLagerScreen ? _defaultLagerWidth : double.infinity;
    Log.d(
        "screenWidth x screenHeight : ${ScreenUtil().screenWidth} x ${ScreenUtil().screenHeight}");
  }

  double setOffSetInScreen({
    required double size,
    required bool isDx,
    required BuildContext context,
  }) {
    if (isDx) {
      final screenWidth = ScreenUtil().screenWidth;

      final middle = screenWidth / 2;
      final snapped =
          size < middle ? DimensRes.sp20 : screenWidth - DimensRes.sp80;

      return max(min(snapped, screenWidth), 0);
    } else {
      final bottomLimit = ScreenUtil().screenHeight -
          ScreenUtil().bottomBarHeight -
          ScreenUtil().statusBarHeight -
          140.h;

      return max(min(size, bottomLimit), 0);
    }
  }

  static const double _defaultLagerWidth = 500.0;
  static const double _defaultSmallWidth = 375.0;
  bool isLagerScreen = false;
  bool isSmallScreen = false;
  double width = 0;
  double widthInfinity = 0;
}

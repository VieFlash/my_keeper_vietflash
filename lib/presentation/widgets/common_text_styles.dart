import 'package:flutter/material.dart';

import '../../common/res/colors.dart';
import '../../common/res/dimens.dart';

class CommonTextStyles {
  static const primary = TextStyle(
    color: ColorsRes.primary,
    fontSize: DimensRes.sp16,
    height: 1,
  );

  static const normal = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp16,
    fontWeight: FontWeight.w500,
    height: 1,
  );

  static const large = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp24,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static const large20 = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp20,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static const medium = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp14,
    fontWeight: FontWeight.w500,
    height: 1,
  );

  static const bold = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp14,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static const extraBold = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp18,
    fontWeight: FontWeight.w900,
    height: 1,
  );

  static const smallBold = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp12,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static const smallBold1 = TextStyle(
      color: ColorsRes.black,
      fontWeight: FontWeight.w700,
      fontSize: DimensRes.sp13,
      height: DimensRes.sp16 / DimensRes.sp13);

  static const small = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp12,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static const smallExtra = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp10,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static const smallExtraBold = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp10,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static const smallExtraX = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp8,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static const textfieldTitle = TextStyle(
    color: ColorsRes.black0,
    fontSize: DimensRes.sp13,
    height: 1,
    fontWeight: FontWeight.w600,
  );

  static const textfieldHintText = TextStyle(
    color: ColorsRes.shadow,
    fontSize: DimensRes.sp13,
    height: 1,
    fontWeight: FontWeight.w400,
  );

  static const textfieldCounterText = TextStyle(
    color: ColorsRes.textfieldCounterText,
    fontSize: DimensRes.sp13,
    height: 1,
    fontWeight: FontWeight.w400,
  );

  static const screenTitle = TextStyle(
    color: ColorsRes.black,
    fontSize: DimensRes.sp18,
    height: 1,
    fontWeight: FontWeight.w700,
  );

  static const blueTextButton = TextStyle(
    color: ColorsRes.blueButtonText,
    fontSize: DimensRes.sp18,
    height: 1,
    fontWeight: FontWeight.w700,
  );

  static const disabledTextButton = TextStyle(
    color: ColorsRes.textfieldBorder,
    fontSize: DimensRes.sp18,
    height: 1,
    fontWeight: FontWeight.w400,
  );
}

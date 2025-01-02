import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../common/res/colors.dart';

@singleton
class Gaps {
  /// Blank space between items in row
  static const hGap1 = SizedBox(width: 1);
  static const hGap2 = SizedBox(width: 2);
  static const hGap3 = SizedBox(width: 3);
  static const hGap4 = SizedBox(width: 4);
  static const hGap5 = SizedBox(width: 5);
  static const hGap6 = SizedBox(width: 6);
  static const hGap7 = SizedBox(width: 7);
  static const hGap8 = SizedBox(width: 8);
  static const hGap9 = SizedBox(width: 9);
  static const hGap10 = SizedBox(width: 10);
  static const hGap11 = SizedBox(width: 11);
  static const hGap12 = SizedBox(width: 12);
  static const hGap14 = SizedBox(width: 14);
  static const hGap15 = SizedBox(width: 15);
  static const hGap16 = SizedBox(width: 16);
  static const hGap18 = SizedBox(width: 18);
  static const hGap22 = SizedBox(width: 22);
  static const hGap20 = SizedBox(width: 20);
  static const hGap24 = SizedBox(width: 24);
  static const hGap30 = SizedBox(width: 30);
  static const hGap32 = SizedBox(width: 32);
  static const hGap40 = SizedBox(width: 40);
  static const hGap50 = SizedBox(width: 50);
  static const hGap80 = SizedBox(width: 80);
  static const hGap118 = SizedBox(width: 118);

  /// Blank space between items in column
  static const vGap2 = SizedBox(height: 2);
  static const vGap3 = SizedBox(height: 3);
  static const vGap3_5 = SizedBox(height: 3.5);
  static const vGap4 = SizedBox(height: 4);
  static const vGap4_5 = SizedBox(height: 4.5);
  static const vGap5 = SizedBox(height: 5);
  static const vGap6 = SizedBox(height: 6);
  static const vGap7 = SizedBox(height: 7);
  static const vGap8 = SizedBox(height: 8);
  static const vGap9 = SizedBox(height: 9);
  static const vGap10 = SizedBox(height: 10);
  static const vGap11 = SizedBox(height: 11);
  static const vGap12 = SizedBox(height: 12);
  static const vGap14 = SizedBox(height: 14);
  static const vGap15 = SizedBox(height: 15);
  static const vGap16 = SizedBox(height: 16);
  static const vGap17 = SizedBox(height: 17);
  static const vGap18 = SizedBox(height: 18);
  static const vGap19 = SizedBox(height: 19);
  static const vGap20 = SizedBox(height: 20);
  static const vGap21 = SizedBox(height: 21);
  static const vGap22 = SizedBox(height: 22);
  static const vGap23 = SizedBox(height: 23);
  static const vGap24 = SizedBox(height: 24);
  static const vGap25 = SizedBox(height: 25);
  static const vGap26 = SizedBox(height: 26);
  static const vGap30 = SizedBox(height: 30);
  static const vGap31 = SizedBox(height: 31);
  static const vGap32 = SizedBox(height: 32);
  static const vGap33 = SizedBox(height: 33);
  static const vGap35 = SizedBox(height: 35);
  static const vGap36 = SizedBox(height: 36);
  static const vGap38 = SizedBox(height: 38);
  static const vGap40 = SizedBox(height: 40);
  static const vGap41 = SizedBox(height: 41);
  static const vGap42 = SizedBox(height: 42);
  static const vGap44 = SizedBox(height: 44);
  static const vGap46 = SizedBox(height: 46);
  static const vGap48 = SizedBox(height: 48);
  static const vGap50 = SizedBox(height: 50);
  static const vGap51 = SizedBox(height: 51);
  static const vGap52 = SizedBox(height: 52);
  static const vGap55 = SizedBox(height: 55);
  static const vGap56 = SizedBox(height: 56);
  static const vGap60 = SizedBox(height: 60);
  static const vGap61 = SizedBox(height: 61);
  static const vGap66 = SizedBox(height: 66);
  static const vGap70 = SizedBox(height: 70);
  static const vGap72 = SizedBox(height: 72);
  static const vGap80 = SizedBox(height: 80);
  static const vGap94 = SizedBox(height: 94);
  static const vGap100 = SizedBox(height: 100);
  static const vGap200 = SizedBox(height: 200);

  /// Vertical line
  static const vLine = SizedBox(
    height: 1,
    width: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(color: ColorsRes.borderGray),
    ),
  );

  static SizedBox vLineDecor(
      [double height = 1.5, Color color = ColorsRes.borderGray]) =>
      SizedBox(
        height: height,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
        ),
      );

  static const Divider line = Divider(height: 0, indent: 0);

  static const Divider vLineGray = Divider(
    color: ColorsRes.borderGray,
    height: 1,
  );
  static const Divider vLineGray200 = Divider(
    color: ColorsRes.gray200,
    height: 1,
  );

  static Container vLineGrayOpacityDrawer = Container(
    color: ColorsRes.black87.withOpacity(0.1),
    height: 2,
    width: double.infinity,
  );

  static Divider vLineGrayOpacity = const Divider(
    color: ColorsRes.borderGray,
    height: 2,
  );

  static const Divider vLineBlack = Divider(
    color: ColorsRes.black0,
    height: 1,
  );

  static const boxShadow = <BoxShadow>[
    BoxShadow(color: ColorsRes.borderGray, offset: Offset(0, 1)),
  ];

  static const empty = SizedBox.shrink();
}

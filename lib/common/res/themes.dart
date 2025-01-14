import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData commonThemeData(BuildContext context) {
    return ThemeData(
      primaryColor: ColorsRes.primary,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      iconTheme: const IconThemeData(color: ColorsRes.contentLightTheme),
      colorScheme: const ColorScheme.light(
        primary: ColorsRes.primary,
        secondary: ColorsRes.secondary,
        error: ColorsRes.error,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: ColorsRes.contentLightTheme.withOpacity(0.7),
        unselectedItemColor: ColorsRes.contentLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: ColorsRes.primary),
        showUnselectedLabels: true,
      ),
      bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: ColorsRes.white),
    );
  }
}
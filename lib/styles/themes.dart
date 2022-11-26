import 'package:flutter/material.dart';

import 'styles.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.backgroundColor,
    ),
  );
}

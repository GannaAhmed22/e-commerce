import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeApp{
  static ThemeData themeApp = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor
  );
}
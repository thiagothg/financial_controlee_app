import 'package:flutter/material.dart';

import '../interface/theme_app_interface.dart';
import 'app_theme_dark.dart';
import 'app_theme_light.dart';

class AppThemeFactory {
  static IThemeAppInterface getTheme(ThemeMode themeMode){
    switch (themeMode) {
      case ThemeMode.dark:
          return AppThemeDark();
      case ThemeMode.light:
          return AppThemeLight();
      default:
        return AppThemeLight();
    }
  }
}
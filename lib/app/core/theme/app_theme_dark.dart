
import 'package:flutter/material.dart';
import '../interface/theme_app_interface.dart';


class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark
    );
  }

  @override
  String themeToString() {
    return ThemeMode.dark.toString();
  }
  
}
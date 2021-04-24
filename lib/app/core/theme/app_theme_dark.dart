
import 'package:financialcontroleeapp/app/core/consts/colors.conts.dart';
import 'package:flutter/material.dart';
import '../interface/theme_app_interface.dart';


class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(),
      // primaryColorDark: Colors.deepPurple.shade50
      // primaryColor: Colors.white
    );
  }

  @override
  String themeToString() {
    return ThemeMode.dark.toString();
  }
  
}
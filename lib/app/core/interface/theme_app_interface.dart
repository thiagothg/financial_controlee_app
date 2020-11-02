import 'package:flutter/material.dart';

abstract class IThemeAppInterface {
  
  ThemeData getTheme(BuildContext context);
  String themeToString();
}
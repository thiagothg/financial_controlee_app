import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black87,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    cardTheme: CardTheme(
      shadowColor: Colors.white,
      elevation: 8,
      margin: const EdgeInsets.all(10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)),
    ));

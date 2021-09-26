import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    textTheme: TextTheme(button: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // primary: Colors.blueAccent,
            // onPrimary: Colors.white,
            // onSurface: Colors.grey,
            elevation: 5,
            textStyle: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32))))),
    cardTheme: CardTheme(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white)),
    ));

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black87,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    primaryColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.blueAccent),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
            onPrimary: Colors.white,
            onSurface: Colors.grey,
            elevation: 5,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32))))),
    cardTheme: CardTheme(
      shadowColor: Colors.white,
      elevation: 8,
      margin: const EdgeInsets.all(10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)),
    ));

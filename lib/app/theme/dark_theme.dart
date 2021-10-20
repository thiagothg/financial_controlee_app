import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
    // fontFamily: 'Google',
    fontFamily: GoogleFonts.varelaRound().fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black87,
    // highlightColor: Colors.transparent,
    // splashColor: Colors.transparent,
    primaryColor: Colors.blueAccent,
    iconTheme: IconThemeData(color: Colors.white),
    // textTheme: GoogleFonts.varelaRoundTextTheme(Get.textTheme).copyWith(
    //     button: TextStyle(color: Colors.white),
    //     headline1: TextStyle(color: Colors.white),
    //     bodyText2: TextStyle(color: Colors.white)),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.white),
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

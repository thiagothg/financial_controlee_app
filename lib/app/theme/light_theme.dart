import '../global/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  // fontFamily: 'Google',
  fontFamily: GoogleFonts.varelaRound().fontFamily,
  brightness: Brightness.light,
  // primarySwatch: MaterialColor(0xff3A57E2,),
  // scaffoldBackgroundColor: Colors.white,
  // highlightColor: Colors.transparent,
  // splashColor: Colors.transparent,
  primaryColorLight: Colors.white,
  primaryColor: AppColors.primaryColor,
  colorScheme: ThemeData().colorScheme.copyWith(
        secondary: AppColors.primaryColor,
        primary: AppColors.primaryColor,
        brightness: Brightness.light,
      ),
  // canvasColor: AppColors.primaryColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.primaryColor,
    elevation: 0,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  backgroundColor: AppColors.greenColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.white,
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  ),
  textTheme: GoogleFonts.varelaRoundTextTheme(Get.textTheme).copyWith(
    button: TextStyle(
      color: Colors.white,
    ).apply(
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      // primary: Colors.blueAccent,
      // onPrimary: Colors.white,
      // onSurface: Colors.grey,
      elevation: 5,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 5,
    color: AppColors.primaryColor,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.primaryColor,
    hoverColor: AppColors.primaryColor,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade400,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 10,
    ),
    // focusedBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: AppColors.primaryColor,
    //   ),
    // ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade400,
      ),
    ),
    // focusedBorder: InputBorder(borderSide: )
  ),
  iconTheme: IconThemeData(color: Colors.white, opacity: 1),
  indicatorColor: Colors.white,
);

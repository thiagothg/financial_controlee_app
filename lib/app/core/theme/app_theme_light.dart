import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/colors.conts.dart';
import '../interface/theme_app_interface.dart';



class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Google',
      scaffoldBackgroundColor: Colors.grey[100],
      primaryColor: ColorsConst.primaryColor,
      primaryColorLight: Colors.deepPurple.shade50,
        //ColorsConst.primaryLightColor,
      // buttonColor: ColorsConst.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        primaryColorDark: ColorsConst.primaryColor,
        accentColor: ColorsConst.primaryColor,
        errorColor: Colors.red.shade900
      ),
      buttonTheme: ButtonThemeData(
        height: 50,
        minWidth: double.infinity,
        buttonColor: ColorsConst.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        textTheme: ButtonTextTheme.primary
      ),
      iconTheme: IconThemeData(
        // color: Colors.white
      ),
      accentColor: ColorsConst.primaryColor,
      backgroundColor: Colors.white,
      cardTheme: CardTheme(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),

      ),
      textTheme: GoogleFonts.cantarellTextTheme(
        Theme.of(context).textTheme
      ).copyWith(
        headline6: TextStyle(
          color: ColorsConst.primaryColor
        ),
        subtitle2: TextStyle(
          decoration: TextDecoration.none
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(

      ),
      bottomAppBarColor: Colors.black12,
      indicatorColor: Colors.green,
      disabledColor: Colors.black12,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsConst.primaryColor
      ),
      splashColor: Colors.deepPurple.shade800,
      errorColor: Colors.red.shade900,
      inputDecorationTheme: InputDecorationTheme(
        // labelStyle: 
      ),
    
    );
  }

  @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
  
}
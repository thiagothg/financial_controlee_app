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
      primaryColorLight: ColorsConst.primaryLightColor,
      // buttonColor: ColorsConst.primaryColor,
      
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
        )
      ),
      bottomAppBarTheme: BottomAppBarTheme(

      ),
      bottomAppBarColor: Colors.black12,
      indicatorColor: Colors.green,
      disabledColor: Colors.black12,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue[800]
      ),
      splashColor: Colors.blue[800]
    );
  }

  @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
  
}
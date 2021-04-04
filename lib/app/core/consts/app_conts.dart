import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:money2/money2.dart';

class HasuraConfig {
  
  static const hasuraUrl = 'https://financial-controllee-app.herokuapp.com/v1/graphql';
  
}

// ignore: avoid_classes_with_only_static_members
class L10n {

  static final all = [
    Locale('en', 'US'),
    Locale('pt', 'BR'),
  ];
  
  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return '🇦🇪';
      case 'hi':
        return '🇮🇳';
      case 'es':
        return '🇪🇸';
      case 'de':
        return '🇩🇪';
      case 'en':
      default:
        return '🇺🇸';
    }
  }

  static Locale getCurrentLocale() {
    var code = Intl.getCurrentLocale().split('_');
    
    if(code.length > 1) {
      return  Locale(code.first, code.last);
    } else {
      return Locale(code.first);
    }
  }

  static NumberFormat getCurrency() {   
    return NumberFormat.simpleCurrency(
      locale: Intl.getCurrentLocale(),
    );
  }
}
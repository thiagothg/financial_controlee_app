import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

    if (code.length > 1) {
      return Locale(code.first, code.last);
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

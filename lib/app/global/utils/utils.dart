import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Utils {
  String getMoneyFormat(double qtd) {
    var currency = NumberFormat.simpleCurrency(
      locale: Intl.getCurrentLocale(),
    );
    return currency.format(qtd);
  }

  static void safePrint(String? value) {
    if (!kReleaseMode) {
      // ignore: avoid_print
      print(value);
    }
  }
}

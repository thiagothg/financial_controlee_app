import 'package:intl/intl.dart';

class Utils {
  String getMoneyFormat(double qtd) {
    var currency = NumberFormat.simpleCurrency(
      locale: Intl.getCurrentLocale(),
    );
    return currency.format(qtd);
  }
}

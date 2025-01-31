import 'package:intl/intl.dart';

class ConverterUtil {
  static String formatPrice(double price) {
    final format = NumberFormat.simpleCurrency(locale: 'en_US');
    return format.format(price);
  }
}

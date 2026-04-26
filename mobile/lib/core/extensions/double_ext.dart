import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toMoney({
    String locale = 'vi_VN',
    String symbol = 'đ',
  }) {
    final formatterVND = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatterVND.format(this);
  }
}

extension IntExtension on int {
  String toMoney({
    String locale = 'vi_VN',
    String symbol = 'đ',
  }) {
    final formatterVND = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatterVND.format(this);
  }
}

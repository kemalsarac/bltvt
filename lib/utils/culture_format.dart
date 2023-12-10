// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

String _local = "tr_TR";

String moneyFormat(num value) {
  // return NumberFormat("#,###.00", _local).format(value);
  return NumberFormat("#,##0.00", _local).format(value);
  // return NumberFormat.currency(locale: _local, decimalDigits: 2, symbol: null).format(value);
}

String quantityFormat(num value) {
  // return NumberFormat("#,###.00", _local).format(value);
  return NumberFormat("#,##0.##", _local).format(value);
  // return NumberFormat.currency(locale: _local, decimalDigits: 2, symbol: null).format(value);
}

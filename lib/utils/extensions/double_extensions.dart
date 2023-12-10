import 'package:decimal/decimal.dart';

extension DoubleExtensions on double {
  toDecimal() {
    Decimal.parse(toStringAsFixed(8));
  }
}

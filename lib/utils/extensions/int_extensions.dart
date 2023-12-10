import 'package:decimal/decimal.dart';

extension IntExtensions on int {
  Decimal toDecimalOrDefault([int defaultValue = 0]) {
    return Decimal.fromInt(this ?? defaultValue);
  }

  int getValueOrDefault([int defaultValue = 0]) {
    return (this ?? defaultValue);
  }
}

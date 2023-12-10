import 'package:decimal/decimal.dart';
// import 'dart:math' as math;

extension DecimalExtensions on Decimal {
  Decimal getValueOrDefault([int defaultValue = 0]) =>
      this ??
      (defaultValue == 0 ? Decimal.zero : Decimal.fromInt(defaultValue));

  // ///Divides this number with given divisor and truncates the result to an integer
  // Decimal divideAndtruncate(int divisor) {
  //   Decimal decDivisor = Decimal.fromInt(divisor);
  //   var divisionResult = this / decDivisor;
  //   return Decimal.fromInt(divisionResult.toInt());
  // }

  // Decimal abs() {
  //   return this.getValueOrDefault() > Decimal.zero ? this.getValueOrDefault() : Decimal.fromInt(-1) * this.getValueOrDefault();
  // }

  // Decimal roundTo(int places) {
  //   Decimal mod = Decimal.fromInt(math.pow(10.0, places).toInt());
  //   var result = ((this * mod).round() / mod);
  //   return result;
  // }
}

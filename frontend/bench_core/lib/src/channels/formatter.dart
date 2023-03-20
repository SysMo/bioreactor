import 'dart:math';

abstract class Formatter<V> {
  String formatObject(Object value) {
    if (value is V) {
      return format(value as V);
    } else {
      return value.toString();
    }
  }

  String format(V value);
}

class FloatFormatter extends Formatter<double> {
  int significantDigits = 3;

  @override
  String format(double value) {
    var exp = log(value) / log(10.0);
    var roundingMult = pow(10, (significantDigits - exp.floor() - 1));
    var valueRounded = (value * roundingMult).round() / roundingMult;
    return "$valueRounded";
  }
}

class PercentFormatter extends Formatter<double> {
  int significantDigits = 2;

  @override
  String format(double value) {
    var exp = value.abs() < 1e-10 ? 0 : log(value.abs()) / log(10.0);
    var roundingMult = pow(10, (significantDigits - exp.floor() - 1));
    var valueRounded = (value * roundingMult).round() / roundingMult * 100.0;
    return "$valueRounded%";
  }
}

class OnOffFormatter extends Formatter<bool> {
  @override
  String format(bool value) => value ? "on" : "off";
}

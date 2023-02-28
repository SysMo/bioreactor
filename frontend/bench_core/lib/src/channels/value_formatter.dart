import 'package:sprintf/sprintf.dart';

abstract class ValueFormatter<T> {
  String format(T value);
}

class FixedNumberFormatter extends ValueFormatter<double> {
  int precision;
  FixedNumberFormatter({this.precision = 3});

  @override
  String format(double value) {
    return sprintf("%.${precision}f", [value]);
  }
}

class PercentFormatter extends ValueFormatter<double> {
  int precision;
  PercentFormatter({this.precision = 0});

  @override
  String format(double value) {
    return sprintf("%.${precision}f", [value * 100.0]);
  }
}

import 'package:sprintf/sprintf.dart';
import 'package:bench_core/messages.dart';

abstract class ValueFormatter {
  String noneStr() => "N/A";
  String format(Value value);
}

class FixedNumberFormatter extends ValueFormatter {
  int precision;
  FixedNumberFormatter({this.precision = 3});

  @override
  String format(Value value) {
    double? valueReal = value.asReal();
    return (valueReal != null)
        ? sprintf("%.${precision}f", [valueReal])
        : noneStr();
  }
}

class PercentFormatter extends ValueFormatter {
  int precision;
  PercentFormatter({this.precision = 0});

  @override
  String format(Value value) {
    double? valueReal = value.asReal();
    return (valueReal != null)
        ? sprintf("%.${precision}f", [valueReal * 100.0])
        : noneStr();
  }
}

class BooleanFormatter extends ValueFormatter {
  String high;
  String low;
  BooleanFormatter({this.high = "On", this.low = "Off"});

  @override
  String format(Value value) {
    bool? valueBool = value.asBool();
    return (valueBool != null) ? (valueBool ? high : low) : noneStr();
  }
}

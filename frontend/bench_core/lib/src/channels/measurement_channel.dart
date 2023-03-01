import 'package:bench_core/src/messages/messages.dart';

import 'value_formatter.dart';

class WrongTypeException implements Exception {
  String targetType;
  WrongTypeException(this.targetType);
}

class TypedMeasurementChannel<T> {
  Stream<T> values;

  String? label;
  ValueFormatter? formatter;
  String? unit;

  copyProps<U>(TypedMeasurementChannel<U> other) {
    label = other.label;
    formatter = other.formatter;
    unit = other.unit;
  }

  TypedMeasurementChannel<T> withProps(
      {String? label, ValueFormatter? formatter, String? unit}) {
    var result = TypedMeasurementChannel(values);
    result.label = label ?? this.label;
    result.formatter = formatter ?? this.formatter;
    result.unit = unit ?? this.unit;
    return result;
  }

  TypedMeasurementChannel(this.values);

  TypedMeasurementChannel<T> asBroadcast() {
    var result = TypedMeasurementChannel(values.asBroadcastStream());
    result.copyProps(this);
    return result;
  }

  MeasurementChannel asUntyped() {
    if (T == double) {
      MeasurementChannel result =
          MeasurementChannel(values.map((v) => Value.real(v as double)));
      result.copyProps(this);
      return result;
    } else if (T == bool) {
      MeasurementChannel result =
          MeasurementChannel(values.map((v) => Value.boolean(v as bool)));
      result.copyProps(this);
      return result;
    } else {
      throw UnimplementedError(
          "Cannot convert the type ${T.toString()} to Value");
    }
  }
}

class MeasurementChannel extends TypedMeasurementChannel<Value> {
  MeasurementChannel(super.values);

  @override
  MeasurementChannel asBroadcast() {
    var result = MeasurementChannel(values.asBroadcastStream());
    result.copyProps(this);
    return result;
  }

  TypedMeasurementChannel<double> asReal() => TypedMeasurementChannel(
        values.map((x) {
          double? xReal = x.asReal();
          return (xReal != null) ? xReal : throw WrongTypeException("real");
        }),
      );
}

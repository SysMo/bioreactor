import 'package:bench_core/messages.dart';

import '../../mqtt.dart';
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

  TypedMeasurementChannel<double> asReal() {
    var instance = TypedMeasurementChannel(
      values.map((x) {
        double? xReal = x.asReal();
        return (xReal != null) ? xReal : throw WrongTypeException("real");
      }),
    );
    instance.copyProps(this);
    return instance;
  }

  TypedMeasurementChannel<bool> asBool() {
    var instance = TypedMeasurementChannel(
      values.map((x) {
        bool? xBool = x.asBool();
        return (xBool != null) ? xBool : throw WrongTypeException("bool");
      }),
    );
    instance.copyProps(this);
    return instance;
  }

  TypedMeasurementChannel<T> asTyped<T>(T Function(Value) decoder) {
    var instance = TypedMeasurementChannel<T>(values.map(decoder));
    instance.copyProps(this);
    return instance;
  }
}

class MeasurementChannelCommunicator {
  ValueStreamMqttConnector connector;

  MeasurementChannelCommunicator(
      {required MqttService mqtt, required String topic})
      : connector = ValueStreamMqttConnector(mqtt: mqtt, topic: topic);

  void deviceSide<T>(TypedMeasurementChannel<T> channel) {
    connector.sender(channel.asUntyped().values);
  }

  TypedMeasurementChannel<T> controlSide<T>(T Function(Value) decoder) {
    return MeasurementChannel(connector.receiver())
        .asTyped<T>(decoder)
        .asBroadcast();
  }
}

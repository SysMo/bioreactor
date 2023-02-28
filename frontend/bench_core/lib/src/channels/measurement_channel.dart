import 'value_formatter.dart';

class MeasurementChannel<T> {
  Stream<T> values;
  String? label;
  ValueFormatter<T>? formatter;
  String? unit;
  MeasurementChannel(this.values);
}

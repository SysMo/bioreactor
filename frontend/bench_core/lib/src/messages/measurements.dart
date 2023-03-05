import 'package:freezed_annotation/freezed_annotation.dart';
import 'value.dart';

part 'measurements.freezed.dart';
part 'measurements.g.dart';

@freezed
class MeasurementValue with _$MeasurementValue {
  const factory MeasurementValue({
    required String sensor,
    required Value value,
  }) = _MeasurementValue;

  factory MeasurementValue.fromJson(Map<String, Object?> json) =>
      _$MeasurementValueFromJson(json);
}

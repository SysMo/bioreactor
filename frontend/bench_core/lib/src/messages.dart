import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
class MeasurementValue with _$MeasurementValue {
  const factory MeasurementValue({
    required String sensor,
    required String value,
  }) = _MeasurementValue;

  factory MeasurementValue.fromJson(Map<String, Object?> json) =>
      _$MeasurementValueFromJson(json);
}

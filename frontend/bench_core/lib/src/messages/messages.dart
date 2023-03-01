import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
class Value with _$Value {
  const factory Value.none() = None;
  const factory Value.real(double v) = Real;
  const factory Value.boolean(bool v) = Bool;
}

extension ValueExt on Value {
  double? asReal() => when(
        none: () => null,
        real: (double v) => v,
        boolean: (bool v) => null,
      );

  bool? asBool() => when(
        none: () => null,
        real: (double v) => null,
        boolean: (bool v) => v,
      );
}

@freezed
class MeasurementValue with _$MeasurementValue {
  const factory MeasurementValue({
    required String sensor,
    required String value,
  }) = _MeasurementValue;

  factory MeasurementValue.fromJson(Map<String, Object?> json) =>
      _$MeasurementValueFromJson(json);
}

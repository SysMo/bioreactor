import 'package:freezed_annotation/freezed_annotation.dart';

part 'value.freezed.dart';
part 'value.g.dart';

@freezed
class Value with _$Value {
  const factory Value.none() = None;
  const factory Value.real(double v) = Real;
  const factory Value.boolean(bool v) = Bool;

  factory Value.fromJson(Map<String, Object?> json) => _$ValueFromJson(json);
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

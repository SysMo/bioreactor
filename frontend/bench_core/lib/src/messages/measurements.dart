import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bench_core/src/channels/codec.dart';

part 'measurements.freezed.dart';
part 'measurements.g.dart';

@Freezed(genericArgumentFactories: true)
class Measurement<V> with _$Measurement<V> {
  const factory Measurement({
    required String timestamp,
    required V value,
  }) = _Measurement;

  factory Measurement.fromJson(
          Map<String, Object?> json, V Function(Object?) fromJsonT) =>
      _$MeasurementFromJson(json, fromJsonT);

  static StringCodec<Measurement<V>> codec<V>() => _MeasurementCodec<V>();
}

class _MeasurementCodec<V> extends StringCodec<Measurement<V>> {
  ObjectCodec<V> vCodec = ObjectCodecRegistry.getCodec<V>();
  @override
  Measurement<V> decode(String s) {
    return Measurement.fromJson(jsonDecode(s), vCodec.decode);
  }

  @override
  String encode(Measurement<V> value) {
    return jsonEncode(value.toJson(vCodec.encode));
  }
}

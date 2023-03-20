// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Measurement<V> _$$_MeasurementFromJson<V>(
  Map<String, dynamic> json,
  V Function(Object? json) fromJsonV,
) =>
    _$_Measurement<V>(
      timestamp: json['timestamp'] as String,
      value: fromJsonV(json['value']),
    );

Map<String, dynamic> _$$_MeasurementToJson<V>(
  _$_Measurement<V> instance,
  Object? Function(V value) toJsonV,
) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'value': toJsonV(instance.value),
    };

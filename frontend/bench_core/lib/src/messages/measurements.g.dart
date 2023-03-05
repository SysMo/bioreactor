// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MeasurementValue _$$_MeasurementValueFromJson(Map<String, dynamic> json) =>
    _$_MeasurementValue(
      sensor: json['sensor'] as String,
      value: Value.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MeasurementValueToJson(_$_MeasurementValue instance) =>
    <String, dynamic>{
      'sensor': instance.sensor,
      'value': instance.value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_MeasurementValue _$$_MeasurementValueFromJson(Map<String, dynamic> json) =>
    _$_MeasurementValue(
      sensor: json['sensor'] as String,
      value: Value.fromJson(json['value'] as Map<String, dynamic>),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_MeasurementValueToJson(_$_MeasurementValue instance) =>
    <String, dynamic>{
      'sensor': instance.sensor,
      'value': instance.value,
    };

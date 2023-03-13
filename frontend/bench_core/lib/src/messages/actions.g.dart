// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetValue<V> _$$SetValueFromJson<V>(
  Map<String, dynamic> json,
  V Function(Object? json) fromJsonV,
) =>
    _$SetValue<V>(
      fromJsonV(json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SetValueToJson<V>(
  _$SetValue<V> instance,
  Object? Function(V value) toJsonV,
) =>
    <String, dynamic>{
      'value': toJsonV(instance.value),
      'runtimeType': instance.$type,
    };

_$ReadValue<V> _$$ReadValueFromJson<V>(
  Map<String, dynamic> json,
  V Function(Object? json) fromJsonV,
) =>
    _$ReadValue<V>(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReadValueToJson<V>(
  _$ReadValue<V> instance,
  Object? Function(V value) toJsonV,
) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SetTarget _$$SetTargetFromJson(Map<String, dynamic> json) => _$SetTarget(
      (json['value'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SetTargetToJson(_$SetTarget instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ReadTarget _$$ReadTargetFromJson(Map<String, dynamic> json) => _$ReadTarget(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReadTargetToJson(_$ReadTarget instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

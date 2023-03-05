// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

_$SetpointActionConstr _$$SetpointActionConstrFromJson(
        Map<String, dynamic> json) =>
    _$SetpointActionConstr(
      SetpointAction.fromJson(json['a'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SetpointActionConstrToJson(
        _$SetpointActionConstr instance) =>
    <String, dynamic>{
      'a': instance.a,
    };

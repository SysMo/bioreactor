// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeasurementValue _$MeasurementValueFromJson(Map<String, dynamic> json) {
  return _MeasurementValue.fromJson(json);
}

/// @nodoc
mixin _$MeasurementValue {
  String get sensor => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasurementValueCopyWith<MeasurementValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementValueCopyWith<$Res> {
  factory $MeasurementValueCopyWith(
          MeasurementValue value, $Res Function(MeasurementValue) then) =
      _$MeasurementValueCopyWithImpl<$Res, MeasurementValue>;
  @useResult
  $Res call({String sensor, String value});
}

/// @nodoc
class _$MeasurementValueCopyWithImpl<$Res, $Val extends MeasurementValue>
    implements $MeasurementValueCopyWith<$Res> {
  _$MeasurementValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensor = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      sensor: null == sensor
          ? _value.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasurementValueCopyWith<$Res>
    implements $MeasurementValueCopyWith<$Res> {
  factory _$$_MeasurementValueCopyWith(
          _$_MeasurementValue value, $Res Function(_$_MeasurementValue) then) =
      __$$_MeasurementValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sensor, String value});
}

/// @nodoc
class __$$_MeasurementValueCopyWithImpl<$Res>
    extends _$MeasurementValueCopyWithImpl<$Res, _$_MeasurementValue>
    implements _$$_MeasurementValueCopyWith<$Res> {
  __$$_MeasurementValueCopyWithImpl(
      _$_MeasurementValue _value, $Res Function(_$_MeasurementValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensor = null,
    Object? value = null,
  }) {
    return _then(_$_MeasurementValue(
      sensor: null == sensor
          ? _value.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeasurementValue implements _MeasurementValue {
  const _$_MeasurementValue({required this.sensor, required this.value});

  factory _$_MeasurementValue.fromJson(Map<String, dynamic> json) =>
      _$$_MeasurementValueFromJson(json);

  @override
  final String sensor;
  @override
  final String value;

  @override
  String toString() {
    return 'MeasurementValue(sensor: $sensor, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasurementValue &&
            (identical(other.sensor, sensor) || other.sensor == sensor) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sensor, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementValueCopyWith<_$_MeasurementValue> get copyWith =>
      __$$_MeasurementValueCopyWithImpl<_$_MeasurementValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasurementValueToJson(
      this,
    );
  }
}

abstract class _MeasurementValue implements MeasurementValue {
  const factory _MeasurementValue(
      {required final String sensor,
      required final String value}) = _$_MeasurementValue;

  factory _MeasurementValue.fromJson(Map<String, dynamic> json) =
      _$_MeasurementValue.fromJson;

  @override
  String get sensor;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementValueCopyWith<_$_MeasurementValue> get copyWith =>
      throw _privateConstructorUsedError;
}

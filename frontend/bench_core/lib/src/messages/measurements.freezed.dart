// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Measurement<V> _$MeasurementFromJson<V>(
    Map<String, dynamic> json, V Function(Object?) fromJsonV) {
  return _Measurement<V>.fromJson(json, fromJsonV);
}

/// @nodoc
mixin _$Measurement<V> {
  String get timestamp => throw _privateConstructorUsedError;
  V get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(V) toJsonV) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasurementCopyWith<V, Measurement<V>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementCopyWith<V, $Res> {
  factory $MeasurementCopyWith(
          Measurement<V> value, $Res Function(Measurement<V>) then) =
      _$MeasurementCopyWithImpl<V, $Res, Measurement<V>>;
  @useResult
  $Res call({String timestamp, V value});
}

/// @nodoc
class _$MeasurementCopyWithImpl<V, $Res, $Val extends Measurement<V>>
    implements $MeasurementCopyWith<V, $Res> {
  _$MeasurementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as V,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasurementCopyWith<V, $Res>
    implements $MeasurementCopyWith<V, $Res> {
  factory _$$_MeasurementCopyWith(
          _$_Measurement<V> value, $Res Function(_$_Measurement<V>) then) =
      __$$_MeasurementCopyWithImpl<V, $Res>;
  @override
  @useResult
  $Res call({String timestamp, V value});
}

/// @nodoc
class __$$_MeasurementCopyWithImpl<V, $Res>
    extends _$MeasurementCopyWithImpl<V, $Res, _$_Measurement<V>>
    implements _$$_MeasurementCopyWith<V, $Res> {
  __$$_MeasurementCopyWithImpl(
      _$_Measurement<V> _value, $Res Function(_$_Measurement<V>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = freezed,
  }) {
    return _then(_$_Measurement<V>(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as V,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_Measurement<V> implements _Measurement<V> {
  const _$_Measurement({required this.timestamp, required this.value});

  factory _$_Measurement.fromJson(
          Map<String, dynamic> json, V Function(Object?) fromJsonV) =>
      _$$_MeasurementFromJson(json, fromJsonV);

  @override
  final String timestamp;
  @override
  final V value;

  @override
  String toString() {
    return 'Measurement<$V>(timestamp: $timestamp, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Measurement<V> &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementCopyWith<V, _$_Measurement<V>> get copyWith =>
      __$$_MeasurementCopyWithImpl<V, _$_Measurement<V>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(V) toJsonV) {
    return _$$_MeasurementToJson<V>(this, toJsonV);
  }
}

abstract class _Measurement<V> implements Measurement<V> {
  const factory _Measurement(
      {required final String timestamp,
      required final V value}) = _$_Measurement<V>;

  factory _Measurement.fromJson(
          Map<String, dynamic> json, V Function(Object?) fromJsonV) =
      _$_Measurement<V>.fromJson;

  @override
  String get timestamp;
  @override
  V get value;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementCopyWith<V, _$_Measurement<V>> get copyWith =>
      throw _privateConstructorUsedError;
}

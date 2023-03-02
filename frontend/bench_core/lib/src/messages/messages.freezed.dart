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

Value _$ValueFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'none':
      return None.fromJson(json);
    case 'real':
      return Real.fromJson(json);
    case 'boolean':
      return Bool.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Value',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Value {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(double v) real,
    required TResult Function(bool v) boolean,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(double v)? real,
    TResult? Function(bool v)? boolean,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(double v)? real,
    TResult Function(bool v)? boolean,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(Real value) real,
    required TResult Function(Bool value) boolean,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(Real value)? real,
    TResult? Function(Bool value)? boolean,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(Real value)? real,
    TResult Function(Bool value)? boolean,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueCopyWith<$Res> {
  factory $ValueCopyWith(Value value, $Res Function(Value) then) =
      _$ValueCopyWithImpl<$Res, Value>;
}

/// @nodoc
class _$ValueCopyWithImpl<$Res, $Val extends Value>
    implements $ValueCopyWith<$Res> {
  _$ValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoneCopyWith<$Res> {
  factory _$$NoneCopyWith(_$None value, $Res Function(_$None) then) =
      __$$NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneCopyWithImpl<$Res> extends _$ValueCopyWithImpl<$Res, _$None>
    implements _$$NoneCopyWith<$Res> {
  __$$NoneCopyWithImpl(_$None _value, $Res Function(_$None) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$None implements None {
  const _$None({final String? $type}) : $type = $type ?? 'none';

  factory _$None.fromJson(Map<String, dynamic> json) => _$$NoneFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Value.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$None);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(double v) real,
    required TResult Function(bool v) boolean,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(double v)? real,
    TResult? Function(bool v)? boolean,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(double v)? real,
    TResult Function(bool v)? boolean,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(Real value) real,
    required TResult Function(Bool value) boolean,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(Real value)? real,
    TResult? Function(Bool value)? boolean,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(Real value)? real,
    TResult Function(Bool value)? boolean,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoneToJson(
      this,
    );
  }
}

abstract class None implements Value {
  const factory None() = _$None;

  factory None.fromJson(Map<String, dynamic> json) = _$None.fromJson;
}

/// @nodoc
abstract class _$$RealCopyWith<$Res> {
  factory _$$RealCopyWith(_$Real value, $Res Function(_$Real) then) =
      __$$RealCopyWithImpl<$Res>;
  @useResult
  $Res call({double v});
}

/// @nodoc
class __$$RealCopyWithImpl<$Res> extends _$ValueCopyWithImpl<$Res, _$Real>
    implements _$$RealCopyWith<$Res> {
  __$$RealCopyWithImpl(_$Real _value, $Res Function(_$Real) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$Real(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Real implements Real {
  const _$Real(this.v, {final String? $type}) : $type = $type ?? 'real';

  factory _$Real.fromJson(Map<String, dynamic> json) => _$$RealFromJson(json);

  @override
  final double v;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Value.real(v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Real &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RealCopyWith<_$Real> get copyWith =>
      __$$RealCopyWithImpl<_$Real>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(double v) real,
    required TResult Function(bool v) boolean,
  }) {
    return real(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(double v)? real,
    TResult? Function(bool v)? boolean,
  }) {
    return real?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(double v)? real,
    TResult Function(bool v)? boolean,
    required TResult orElse(),
  }) {
    if (real != null) {
      return real(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(Real value) real,
    required TResult Function(Bool value) boolean,
  }) {
    return real(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(Real value)? real,
    TResult? Function(Bool value)? boolean,
  }) {
    return real?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(Real value)? real,
    TResult Function(Bool value)? boolean,
    required TResult orElse(),
  }) {
    if (real != null) {
      return real(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RealToJson(
      this,
    );
  }
}

abstract class Real implements Value {
  const factory Real(final double v) = _$Real;

  factory Real.fromJson(Map<String, dynamic> json) = _$Real.fromJson;

  double get v;
  @JsonKey(ignore: true)
  _$$RealCopyWith<_$Real> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BoolCopyWith<$Res> {
  factory _$$BoolCopyWith(_$Bool value, $Res Function(_$Bool) then) =
      __$$BoolCopyWithImpl<$Res>;
  @useResult
  $Res call({bool v});
}

/// @nodoc
class __$$BoolCopyWithImpl<$Res> extends _$ValueCopyWithImpl<$Res, _$Bool>
    implements _$$BoolCopyWith<$Res> {
  __$$BoolCopyWithImpl(_$Bool _value, $Res Function(_$Bool) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$Bool(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Bool implements Bool {
  const _$Bool(this.v, {final String? $type}) : $type = $type ?? 'boolean';

  factory _$Bool.fromJson(Map<String, dynamic> json) => _$$BoolFromJson(json);

  @override
  final bool v;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Value.boolean(v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Bool &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoolCopyWith<_$Bool> get copyWith =>
      __$$BoolCopyWithImpl<_$Bool>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(double v) real,
    required TResult Function(bool v) boolean,
  }) {
    return boolean(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(double v)? real,
    TResult? Function(bool v)? boolean,
  }) {
    return boolean?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(double v)? real,
    TResult Function(bool v)? boolean,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(Real value) real,
    required TResult Function(Bool value) boolean,
  }) {
    return boolean(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(Real value)? real,
    TResult? Function(Bool value)? boolean,
  }) {
    return boolean?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(Real value)? real,
    TResult Function(Bool value)? boolean,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BoolToJson(
      this,
    );
  }
}

abstract class Bool implements Value {
  const factory Bool(final bool v) = _$Bool;

  factory Bool.fromJson(Map<String, dynamic> json) = _$Bool.fromJson;

  bool get v;
  @JsonKey(ignore: true)
  _$$BoolCopyWith<_$Bool> get copyWith => throw _privateConstructorUsedError;
}

MeasurementValue _$MeasurementValueFromJson(Map<String, dynamic> json) {
  return _MeasurementValue.fromJson(json);
}

/// @nodoc
mixin _$MeasurementValue {
  String get sensor => throw _privateConstructorUsedError;
  Value get value => throw _privateConstructorUsedError;

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
  $Res call({String sensor, Value value});

  $ValueCopyWith<$Res> get value;
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
              as Value,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ValueCopyWith<$Res> get value {
    return $ValueCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
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
  $Res call({String sensor, Value value});

  @override
  $ValueCopyWith<$Res> get value;
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
              as Value,
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
  final Value value;

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
      required final Value value}) = _$_MeasurementValue;

  factory _MeasurementValue.fromJson(Map<String, dynamic> json) =
      _$_MeasurementValue.fromJson;

  @override
  String get sensor;
  @override
  Value get value;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementValueCopyWith<_$_MeasurementValue> get copyWith =>
      throw _privateConstructorUsedError;
}

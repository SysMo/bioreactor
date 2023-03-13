// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetValueAction<V> _$SetValueActionFromJson<V>(
    Map<String, dynamic> json, V Function(Object?) fromJsonV) {
  switch (json['runtimeType']) {
    case 'setValue':
      return SetValue<V>.fromJson(json, fromJsonV);
    case 'readValue':
      return ReadValue<V>.fromJson(json, fromJsonV);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SetValueAction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SetValueAction<V> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(V value) setValue,
    required TResult Function() readValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(V value)? setValue,
    TResult? Function()? readValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(V value)? setValue,
    TResult Function()? readValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetValue<V> value) setValue,
    required TResult Function(ReadValue<V> value) readValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetValue<V> value)? setValue,
    TResult? Function(ReadValue<V> value)? readValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetValue<V> value)? setValue,
    TResult Function(ReadValue<V> value)? readValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(V) toJsonV) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetValueActionCopyWith<V, $Res> {
  factory $SetValueActionCopyWith(
          SetValueAction<V> value, $Res Function(SetValueAction<V>) then) =
      _$SetValueActionCopyWithImpl<V, $Res, SetValueAction<V>>;
}

/// @nodoc
class _$SetValueActionCopyWithImpl<V, $Res, $Val extends SetValueAction<V>>
    implements $SetValueActionCopyWith<V, $Res> {
  _$SetValueActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetValueCopyWith<V, $Res> {
  factory _$$SetValueCopyWith(
          _$SetValue<V> value, $Res Function(_$SetValue<V>) then) =
      __$$SetValueCopyWithImpl<V, $Res>;
  @useResult
  $Res call({V value});
}

/// @nodoc
class __$$SetValueCopyWithImpl<V, $Res>
    extends _$SetValueActionCopyWithImpl<V, $Res, _$SetValue<V>>
    implements _$$SetValueCopyWith<V, $Res> {
  __$$SetValueCopyWithImpl(
      _$SetValue<V> _value, $Res Function(_$SetValue<V>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$SetValue<V>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as V,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$SetValue<V> implements SetValue<V> {
  const _$SetValue(this.value, {final String? $type})
      : $type = $type ?? 'setValue';

  factory _$SetValue.fromJson(
          Map<String, dynamic> json, V Function(Object?) fromJsonV) =>
      _$$SetValueFromJson(json, fromJsonV);

  @override
  final V value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SetValueAction<$V>.setValue(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetValue<V> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetValueCopyWith<V, _$SetValue<V>> get copyWith =>
      __$$SetValueCopyWithImpl<V, _$SetValue<V>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(V value) setValue,
    required TResult Function() readValue,
  }) {
    return setValue(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(V value)? setValue,
    TResult? Function()? readValue,
  }) {
    return setValue?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(V value)? setValue,
    TResult Function()? readValue,
    required TResult orElse(),
  }) {
    if (setValue != null) {
      return setValue(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetValue<V> value) setValue,
    required TResult Function(ReadValue<V> value) readValue,
  }) {
    return setValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetValue<V> value)? setValue,
    TResult? Function(ReadValue<V> value)? readValue,
  }) {
    return setValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetValue<V> value)? setValue,
    TResult Function(ReadValue<V> value)? readValue,
    required TResult orElse(),
  }) {
    if (setValue != null) {
      return setValue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(V) toJsonV) {
    return _$$SetValueToJson<V>(this, toJsonV);
  }
}

abstract class SetValue<V> implements SetValueAction<V> {
  const factory SetValue(final V value) = _$SetValue<V>;

  factory SetValue.fromJson(
          Map<String, dynamic> json, V Function(Object?) fromJsonV) =
      _$SetValue<V>.fromJson;

  V get value;
  @JsonKey(ignore: true)
  _$$SetValueCopyWith<V, _$SetValue<V>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadValueCopyWith<V, $Res> {
  factory _$$ReadValueCopyWith(
          _$ReadValue<V> value, $Res Function(_$ReadValue<V>) then) =
      __$$ReadValueCopyWithImpl<V, $Res>;
}

/// @nodoc
class __$$ReadValueCopyWithImpl<V, $Res>
    extends _$SetValueActionCopyWithImpl<V, $Res, _$ReadValue<V>>
    implements _$$ReadValueCopyWith<V, $Res> {
  __$$ReadValueCopyWithImpl(
      _$ReadValue<V> _value, $Res Function(_$ReadValue<V>) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ReadValue<V> implements ReadValue<V> {
  const _$ReadValue({final String? $type}) : $type = $type ?? 'readValue';

  factory _$ReadValue.fromJson(
          Map<String, dynamic> json, V Function(Object?) fromJsonV) =>
      _$$ReadValueFromJson(json, fromJsonV);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SetValueAction<$V>.readValue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReadValue<V>);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(V value) setValue,
    required TResult Function() readValue,
  }) {
    return readValue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(V value)? setValue,
    TResult? Function()? readValue,
  }) {
    return readValue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(V value)? setValue,
    TResult Function()? readValue,
    required TResult orElse(),
  }) {
    if (readValue != null) {
      return readValue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetValue<V> value) setValue,
    required TResult Function(ReadValue<V> value) readValue,
  }) {
    return readValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetValue<V> value)? setValue,
    TResult? Function(ReadValue<V> value)? readValue,
  }) {
    return readValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetValue<V> value)? setValue,
    TResult Function(ReadValue<V> value)? readValue,
    required TResult orElse(),
  }) {
    if (readValue != null) {
      return readValue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(V) toJsonV) {
    return _$$ReadValueToJson<V>(this, toJsonV);
  }
}

abstract class ReadValue<V> implements SetValueAction<V> {
  const factory ReadValue() = _$ReadValue<V>;

  factory ReadValue.fromJson(
          Map<String, dynamic> json, V Function(Object?) fromJsonV) =
      _$ReadValue<V>.fromJson;
}

SetPointAction _$SetPointActionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'setTarget':
      return SetTarget.fromJson(json);
    case 'readTarget':
      return ReadTarget.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SetPointAction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SetPointAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) setTarget,
    required TResult Function() readTarget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double value)? setTarget,
    TResult? Function()? readTarget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? setTarget,
    TResult Function()? readTarget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetTarget value) setTarget,
    required TResult Function(ReadTarget value) readTarget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetTarget value)? setTarget,
    TResult? Function(ReadTarget value)? readTarget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetTarget value)? setTarget,
    TResult Function(ReadTarget value)? readTarget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetPointActionCopyWith<$Res> {
  factory $SetPointActionCopyWith(
          SetPointAction value, $Res Function(SetPointAction) then) =
      _$SetPointActionCopyWithImpl<$Res, SetPointAction>;
}

/// @nodoc
class _$SetPointActionCopyWithImpl<$Res, $Val extends SetPointAction>
    implements $SetPointActionCopyWith<$Res> {
  _$SetPointActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetTargetCopyWith<$Res> {
  factory _$$SetTargetCopyWith(
          _$SetTarget value, $Res Function(_$SetTarget) then) =
      __$$SetTargetCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$SetTargetCopyWithImpl<$Res>
    extends _$SetPointActionCopyWithImpl<$Res, _$SetTarget>
    implements _$$SetTargetCopyWith<$Res> {
  __$$SetTargetCopyWithImpl(
      _$SetTarget _value, $Res Function(_$SetTarget) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SetTarget(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetTarget implements SetTarget {
  const _$SetTarget(this.value, {final String? $type})
      : $type = $type ?? 'setTarget';

  factory _$SetTarget.fromJson(Map<String, dynamic> json) =>
      _$$SetTargetFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SetPointAction.setTarget(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTarget &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTargetCopyWith<_$SetTarget> get copyWith =>
      __$$SetTargetCopyWithImpl<_$SetTarget>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) setTarget,
    required TResult Function() readTarget,
  }) {
    return setTarget(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double value)? setTarget,
    TResult? Function()? readTarget,
  }) {
    return setTarget?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? setTarget,
    TResult Function()? readTarget,
    required TResult orElse(),
  }) {
    if (setTarget != null) {
      return setTarget(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetTarget value) setTarget,
    required TResult Function(ReadTarget value) readTarget,
  }) {
    return setTarget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetTarget value)? setTarget,
    TResult? Function(ReadTarget value)? readTarget,
  }) {
    return setTarget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetTarget value)? setTarget,
    TResult Function(ReadTarget value)? readTarget,
    required TResult orElse(),
  }) {
    if (setTarget != null) {
      return setTarget(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SetTargetToJson(
      this,
    );
  }
}

abstract class SetTarget implements SetPointAction {
  const factory SetTarget(final double value) = _$SetTarget;

  factory SetTarget.fromJson(Map<String, dynamic> json) = _$SetTarget.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$SetTargetCopyWith<_$SetTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadTargetCopyWith<$Res> {
  factory _$$ReadTargetCopyWith(
          _$ReadTarget value, $Res Function(_$ReadTarget) then) =
      __$$ReadTargetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadTargetCopyWithImpl<$Res>
    extends _$SetPointActionCopyWithImpl<$Res, _$ReadTarget>
    implements _$$ReadTargetCopyWith<$Res> {
  __$$ReadTargetCopyWithImpl(
      _$ReadTarget _value, $Res Function(_$ReadTarget) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ReadTarget implements ReadTarget {
  const _$ReadTarget({final String? $type}) : $type = $type ?? 'readTarget';

  factory _$ReadTarget.fromJson(Map<String, dynamic> json) =>
      _$$ReadTargetFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SetPointAction.readTarget()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReadTarget);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) setTarget,
    required TResult Function() readTarget,
  }) {
    return readTarget();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double value)? setTarget,
    TResult? Function()? readTarget,
  }) {
    return readTarget?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? setTarget,
    TResult Function()? readTarget,
    required TResult orElse(),
  }) {
    if (readTarget != null) {
      return readTarget();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetTarget value) setTarget,
    required TResult Function(ReadTarget value) readTarget,
  }) {
    return readTarget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetTarget value)? setTarget,
    TResult? Function(ReadTarget value)? readTarget,
  }) {
    return readTarget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetTarget value)? setTarget,
    TResult Function(ReadTarget value)? readTarget,
    required TResult orElse(),
  }) {
    if (readTarget != null) {
      return readTarget(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadTargetToJson(
      this,
    );
  }
}

abstract class ReadTarget implements SetPointAction {
  const factory ReadTarget() = _$ReadTarget;

  factory ReadTarget.fromJson(Map<String, dynamic> json) =
      _$ReadTarget.fromJson;
}

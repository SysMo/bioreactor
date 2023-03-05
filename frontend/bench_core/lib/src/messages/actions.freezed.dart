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

SetpointAction _$SetpointActionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'setTarget':
      return SetTarget.fromJson(json);
    case 'readTarget':
      return ReadTarget.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SetpointAction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SetpointAction {
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
abstract class $SetpointActionCopyWith<$Res> {
  factory $SetpointActionCopyWith(
          SetpointAction value, $Res Function(SetpointAction) then) =
      _$SetpointActionCopyWithImpl<$Res, SetpointAction>;
}

/// @nodoc
class _$SetpointActionCopyWithImpl<$Res, $Val extends SetpointAction>
    implements $SetpointActionCopyWith<$Res> {
  _$SetpointActionCopyWithImpl(this._value, this._then);

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
    extends _$SetpointActionCopyWithImpl<$Res, _$SetTarget>
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
    return 'SetpointAction.setTarget(value: $value)';
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

abstract class SetTarget implements SetpointAction {
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
    extends _$SetpointActionCopyWithImpl<$Res, _$ReadTarget>
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
    return 'SetpointAction.readTarget()';
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

abstract class ReadTarget implements SetpointAction {
  const factory ReadTarget() = _$ReadTarget;

  factory ReadTarget.fromJson(Map<String, dynamic> json) =
      _$ReadTarget.fromJson;
}

ControlAction _$ControlActionFromJson(Map<String, dynamic> json) {
  return SetpointActionConstr.fromJson(json);
}

/// @nodoc
mixin _$ControlAction {
  SetpointAction get a => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SetpointAction a) setpointAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SetpointAction a)? setpointAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SetpointAction a)? setpointAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetpointActionConstr value) setpointAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetpointActionConstr value)? setpointAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetpointActionConstr value)? setpointAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ControlActionCopyWith<ControlAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlActionCopyWith<$Res> {
  factory $ControlActionCopyWith(
          ControlAction value, $Res Function(ControlAction) then) =
      _$ControlActionCopyWithImpl<$Res, ControlAction>;
  @useResult
  $Res call({SetpointAction a});

  $SetpointActionCopyWith<$Res> get a;
}

/// @nodoc
class _$ControlActionCopyWithImpl<$Res, $Val extends ControlAction>
    implements $ControlActionCopyWith<$Res> {
  _$ControlActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
  }) {
    return _then(_value.copyWith(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as SetpointAction,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SetpointActionCopyWith<$Res> get a {
    return $SetpointActionCopyWith<$Res>(_value.a, (value) {
      return _then(_value.copyWith(a: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SetpointActionConstrCopyWith<$Res>
    implements $ControlActionCopyWith<$Res> {
  factory _$$SetpointActionConstrCopyWith(_$SetpointActionConstr value,
          $Res Function(_$SetpointActionConstr) then) =
      __$$SetpointActionConstrCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SetpointAction a});

  @override
  $SetpointActionCopyWith<$Res> get a;
}

/// @nodoc
class __$$SetpointActionConstrCopyWithImpl<$Res>
    extends _$ControlActionCopyWithImpl<$Res, _$SetpointActionConstr>
    implements _$$SetpointActionConstrCopyWith<$Res> {
  __$$SetpointActionConstrCopyWithImpl(_$SetpointActionConstr _value,
      $Res Function(_$SetpointActionConstr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
  }) {
    return _then(_$SetpointActionConstr(
      null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as SetpointAction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetpointActionConstr implements SetpointActionConstr {
  const _$SetpointActionConstr(this.a);

  factory _$SetpointActionConstr.fromJson(Map<String, dynamic> json) =>
      _$$SetpointActionConstrFromJson(json);

  @override
  final SetpointAction a;

  @override
  String toString() {
    return 'ControlAction.setpointAction(a: $a)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetpointActionConstr &&
            (identical(other.a, a) || other.a == a));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, a);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetpointActionConstrCopyWith<_$SetpointActionConstr> get copyWith =>
      __$$SetpointActionConstrCopyWithImpl<_$SetpointActionConstr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SetpointAction a) setpointAction,
  }) {
    return setpointAction(a);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SetpointAction a)? setpointAction,
  }) {
    return setpointAction?.call(a);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SetpointAction a)? setpointAction,
    required TResult orElse(),
  }) {
    if (setpointAction != null) {
      return setpointAction(a);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetpointActionConstr value) setpointAction,
  }) {
    return setpointAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetpointActionConstr value)? setpointAction,
  }) {
    return setpointAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetpointActionConstr value)? setpointAction,
    required TResult orElse(),
  }) {
    if (setpointAction != null) {
      return setpointAction(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SetpointActionConstrToJson(
      this,
    );
  }
}

abstract class SetpointActionConstr implements ControlAction {
  const factory SetpointActionConstr(final SetpointAction a) =
      _$SetpointActionConstr;

  factory SetpointActionConstr.fromJson(Map<String, dynamic> json) =
      _$SetpointActionConstr.fromJson;

  @override
  SetpointAction get a;
  @override
  @JsonKey(ignore: true)
  _$$SetpointActionConstrCopyWith<_$SetpointActionConstr> get copyWith =>
      throw _privateConstructorUsedError;
}

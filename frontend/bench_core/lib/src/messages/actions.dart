import 'dart:convert';
import 'package:bench_core/src/channels/codec.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'actions.freezed.dart';
part 'actions.g.dart';

@Freezed(genericArgumentFactories: true)
class SetValueAction<V> with _$SetValueAction<V> {
  const factory SetValueAction.setValue(V value) = SetValue<V>;
  const factory SetValueAction.readValue() = ReadValue;

  factory SetValueAction.fromJson(
          Map<String, Object?> json, V Function(Object?) fromJsonT) =>
      _$SetValueActionFromJson(json, fromJsonT);

  static StringCodec<SetValueAction<V>> codec<V>() => _SetValueActionCodec<V>();
}

class _SetValueActionCodec<V> extends StringCodec<SetValueAction<V>> {
  ObjectCodec<V> vCodec = ObjectCodecRegistry.getCodec<V>();
  @override
  SetValueAction<V> decode(String s) {
    return SetValueAction.fromJson(jsonDecode(s), vCodec.decode);
  }

  @override
  String encode(SetValueAction<V> value) {
    return jsonEncode(value.toJson(vCodec.encode));
  }
}

@freezed
class SetPointAction with _$SetPointAction {
  const factory SetPointAction.setTarget(double value) = SetTarget;
  const factory SetPointAction.readTarget() = ReadTarget;

  factory SetPointAction.fromJson(Map<String, Object?> json) =>
      _$SetPointActionFromJson(json);
  static StringCodec<SetPointAction> codec = _SetPointActionCodec();
}

class _SetPointActionCodec extends StringCodec<SetPointAction> {
  @override
  SetPointAction decode(String s) => SetPointAction.fromJson(jsonDecode(s));

  @override
  String encode(SetPointAction value) => jsonEncode(value.toJson());
}

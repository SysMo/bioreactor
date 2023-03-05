import 'package:bench_core/mqtt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'actions.freezed.dart';
part 'actions.g.dart';

// abstract class Action {
//   Map<String, Object?> toJson();
// }

// T actionFromJson<T extends Action>(Map<String, Object?> json) {
//   if (T == SetpointAction) {
//     return SetpointAction.fromJson(json) as T;
//   } else {
//     throw UnimplementedError(
//         "actionFromJson cannot handle type ${T.runtimeType}");
//   }
// }

@freezed
class SetpointAction with _$SetpointAction {
  const factory SetpointAction.setTarget(double value) = SetTarget;
  const factory SetpointAction.readTarget() = ReadTarget;

  factory SetpointAction.fromJson(Map<String, Object?> json) =>
      _$SetpointActionFromJson(json);
}

@freezed
class ControlAction with _$ControlAction {
  const factory ControlAction.setpointAction(SetpointAction a) =
      SetpointActionConstr;

  factory ControlAction.fromJson(Map<String, Object?> json) =>
      _$ControlActionFromJson(json);
}

class SetpointActionCodec implements ActionCodec<SetpointAction> {
  @override
  SetpointAction decode(Map<String, Object?> json) =>
      SetpointAction.fromJson(json);

  @override
  Map<String, Object?> encode(SetpointAction obj) => obj.toJson();
}

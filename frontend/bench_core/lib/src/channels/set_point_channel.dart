import 'channel_bus.dart';
import 'connectors.dart';
import 'measurement_channel.dart';
import 'set_value_channel.dart';
import 'package:bench_core/src/messages/actions.dart';
import 'package:bench_core/src/named_tree.dart';

class SetPointChannel extends ChannelBus {
  String id;
  MeasurementChannel<double> current;
  SetValueChannel<double> target;
  SetPointChannel._({
    required this.id,
    required this.current,
    required this.target,
  });
  factory SetPointChannel({required String id}) {
    var current = MeasurementChannel<double>(id: "current");
    var target = SetValueChannel<double>(id: "target");
    return SetPointChannel._(id: id, current: current, target: target);
  }

  @override
  String get busId => id;

  @override
  List<ChannelBus> get children => [current, target];
}

class SetPointDeviceConnector extends DeviceConnector<SetPointChannel> {
  MeasurementDeviceConnector<double> currentConnector;
  SetValueDeviceConnector<double> targetConnector;

  SetPointDeviceConnector(
      {required DeviceReader<double> currentValueReader,
      required DeviceActionHandler<double, SetValueAction> actionHandler})
      : currentConnector = MeasurementDeviceConnector(currentValueReader),
        targetConnector = SetValueDeviceConnector<double>(actionHandler);

  factory SetPointDeviceConnector.fn(
      {required DeviceReader<double> currentValueReader,
      required DeviceReader<double> targetValueReader,
      required DeviceWriter<double> targetValueWriter}) {
    void actionHandler(
            SetValueAction action, StreamController<double> reader) =>
        action.when(
          setValue: (v) {
            targetValueWriter(v);
            reader.add(targetValueReader());
            return;
          },
          readValue: () => reader.add(targetValueReader()),
        );

    return SetPointDeviceConnector(
      currentValueReader: currentValueReader,
      actionHandler: actionHandler,
    );
  }

  @override
  void connectForwardChannels(SetPointChannel bus) {
    currentConnector.connectForwardChannels(bus.current);
    targetConnector.connectForwardChannels(bus.target);
  }

  @override
  void connectReverseChannels(SetPointChannel bus) {
    targetConnector.connectReverseChannels(bus.target);
  }

  @override
  void sample() {
    currentConnector.sample();
  }
}

class SetPointControlConnector extends ControlConnector<SetPointChannel> {
  MeasurementControlConnector<double> currentConnector;
  SetValueControlConnector<double> targetConnector;

  SetPointControlConnector({
    Function(double value)? onCurrentValue,
    Function(double value)? onTargetReadValue,
  })  : currentConnector = MeasurementControlConnector<double>(onCurrentValue),
        targetConnector = SetValueControlConnector<double>(onTargetReadValue);

  @override
  void connectForwardChannels(SetPointChannel bus) {
    currentConnector.connectForwardChannels(bus.current);
    targetConnector.connectForwardChannels(bus.target);
  }

  @override
  void connectReverseChannels(SetPointChannel bus) {
    targetConnector.connectReverseChannels(bus.target);
  }
}

import 'package:bench_core/src/channels/stream_channel.dart';
import 'dart:async';
import 'connectors.dart';
import 'channel_bus.dart';
import 'formatter.dart';

class MeasurementChannel<V> implements ChannelBus {
  ForwardStreamChannel<V> streamChannel;
  MeasurementChannel({required String id, Stream<V>? valueStream})
      : streamChannel = ForwardStreamChannel(id: id, valueStream: valueStream);

  @override
  ChannelTree deviceSideTree() => streamChannel.deviceSideTree();

  @override
  ChannelTree controlSideTree() => streamChannel.controlSideTree();

  @override
  // Not to be used, only for channel groups
  String get busId => throw UnimplementedError();

  @override
  // Not to be used, only for channel groups
  List<ChannelBus> get children => throw UnimplementedError();
}

class MeasurementDeviceConnector<V>
    implements DeviceConnector<MeasurementChannel<V>> {
  DeviceReader<V> deviceReader;
  StreamController<V> readerController = StreamController();
  MeasurementDeviceConnector(this.deviceReader);

  @override
  void connectForwardChannels(MeasurementChannel<V> bus) {
    bus.streamChannel.connect(readerController.stream);
  }

  @override
  void connectReverseChannels(MeasurementChannel<V> bus) {
    // Nothing to do here
  }

  @override
  void sample() {
    readerController.add(deviceReader());
  }
}

class MeasurementControlConnector<V>
    extends ControlConnector<MeasurementChannel<V>> {
  List<OnValueFn<V>> onValue = [];
  Formatter<V>? formatter;
  String? label;
  String? unit;
  late StreamSubscription<V> onValueSubscription;

  MeasurementControlConnector(OnValueFn<V>? onValue) {
    if (onValue != null) {
      this.onValue.add(onValue);
    }
  }

  void setOnValue(OnValueFn<V> onValue) {
    this.onValue.add(onValue);
  }

  void configure({
    Formatter<V>? formatter,
    String? label,
    String? unit,
  }) {
    if (formatter != null) this.formatter = formatter;
    if (label != null) this.label = label;
    if (unit != null) this.unit = unit;
  }

  @override
  void connectForwardChannels(MeasurementChannel<V> bus) {
    onValueSubscription = bus.streamChannel.valueStream.listen((value) {
      for (var f in onValue) {
        f(value);
      }
    });
  }

  @override
  void connectReverseChannels(MeasurementChannel<V> bus) {
    // Nothing to do here
  }

  @override
  void dispose() {
    onValueSubscription.cancel();
  }
}

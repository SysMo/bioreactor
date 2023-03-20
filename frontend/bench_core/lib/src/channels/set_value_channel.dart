import 'package:bench_core/src/channels/stream_channel.dart';
import 'package:bench_core/src/messages/actions.dart';
import 'package:bench_core/src/messages/measurements.dart';
import 'dart:async';
import 'connectors.dart';
import 'channel_bus.dart';

class SetValueChannel<V> extends ChannelBus {
  String id;
  ForwardStreamChannel<Measurement<V>> reader;
  ReverseStreamChannel<SetValueAction<V>> action;
  SetValueChannel._(
      {required this.id, required this.reader, required this.action});
  factory SetValueChannel({required String id}) {
    var readerChannel = ForwardStreamChannel<Measurement<V>>(id: "reader");
    var actionChannel = ReverseStreamChannel<SetValueAction<V>>(id: "action");
    return SetValueChannel._(
        id: id, reader: readerChannel, action: actionChannel);
  }

  @override
  String get busId => id;

  @override
  List<ChannelBus> get children => [reader, action];
}

class SetValueDeviceConnector<V> extends DeviceConnector<SetValueChannel<V>> {
  DeviceActionHandler<V, SetValueAction<V>> actionHandler;
  StreamController<V> readerController = StreamController();

  SetValueDeviceConnector(this.actionHandler);

  factory SetValueDeviceConnector.fn(
      {required DeviceReader<V> valueReader,
      required DeviceWriter<V> valueWriter}) {
    void actionHandler(SetValueAction<V> action, StreamController<V> reader) =>
        action.when(
          setValue: (v) {
            valueWriter(v);
            reader.add(valueReader());
            return;
          },
          readValue: () => reader.add(valueReader()),
        );
    return SetValueDeviceConnector(actionHandler);
  }

  @override
  void connectForwardChannels(SetValueChannel<V> bus) {
    bus.reader.connect(readerController.stream
        .map((v) => Measurement(timestamp: "now", value: v))
        .asBroadcastStream());
  }

  @override
  void connectReverseChannels(SetValueChannel<V> bus) {
    bus.action.valueStream.listen((action) {
      actionHandler(action, readerController);
    });
  }

  @override
  void sample() {
    // TODO: implement sample
  }
}

class SetValueControlConnector<V> extends ControlConnector<SetValueChannel<V>> {
  StreamController<SetValueAction<V>> actionController = StreamController();
  void Function(Measurement<V> value)? onReadValue;
  late StreamSubscription<V> onReadValueSubscription;

  SetValueControlConnector(void Function(Measurement<V> value)? onReadValue) {
    if (onReadValue != null) {
      this.onReadValue = onReadValue;
    }
  }

  void setOnReadValue(void Function(Measurement<V> v) onReadValue) {
    if (this.onReadValue == null) {
      this.onReadValue = onReadValue;
    } else {
      throw StateError("onReadValue already set");
    }
  }

  void dispatch(SetValueAction<V> action) {
    actionController.add(action);
  }

  void setValue(V value) {
    dispatch(SetValueAction.setValue(value));
  }

  void readValue() {
    dispatch(const SetValueAction.readValue());
  }

  @override
  void connectForwardChannels(SetValueChannel<V> bus) {
    bus.reader.valueStream.listen((value) {
      if (onReadValue != null) onReadValue!(value);
    });
  }

  @override
  void connectReverseChannels(SetValueChannel<V> bus) {
    bus.action.connect(actionController.stream);
  }

  @override
  void dispose() {
    onReadValueSubscription.cancel();
  }
}

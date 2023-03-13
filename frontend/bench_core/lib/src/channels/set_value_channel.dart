import 'package:bench_core/src/channels/stream_channel.dart';
import 'package:bench_core/src/messages/actions.dart';
import 'package:bench_core/src/named_tree.dart';

import 'connectors.dart';
import 'channel_bus.dart';

class SetValueChannel<V> extends ChannelBus {
  String id;
  ForwardStreamChannel<V> reader;
  ReverseStreamChannel<SetValueAction<V>> action;
  SetValueChannel._(
      {required this.id, required this.reader, required this.action});
  factory SetValueChannel({required String id}) {
    var readerChannel = ForwardStreamChannel<V>(id: "reader");
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
    bus.reader.connect(readerController.stream.asBroadcastStream());
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
  void Function(V value)? onReadValue;

  SetValueControlConnector(this.onReadValue);

  void dispatch(SetValueAction<V> action) {
    actionController.add(action);
  }

  @override
  void connectForwardChannels(SetValueChannel<V> bus) {
    var onReadValue = this.onReadValue;
    bus.reader.valueStream.listen((value) {
      if (onReadValue != null) onReadValue(value);
    });
  }

  @override
  void connectReverseChannels(SetValueChannel<V> bus) {
    bus.action.connect(actionController.stream);
  }
}

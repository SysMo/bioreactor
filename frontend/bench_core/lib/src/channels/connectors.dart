import 'dart:async';
export 'dart:async' show StreamController;

import 'channel_bus.dart';

typedef DeviceReader<V> = V Function();
typedef DeviceWriter<V> = void Function(V value);
typedef DeviceActionHandler<V, A> = void Function(
  A action,
  StreamController<V> reader,
);

abstract class DeviceConnector<B extends ChannelBus> {
  void sample();
  void connectForwardChannels(B bus);
  void connectReverseChannels(B bus);
}

abstract class ControlConnector<B extends ChannelBus> {
  void connectForwardChannels(B bus);
  void connectReverseChannels(B bus);
  void bindHandler<V>(Stream<V> stream, Function(V value)? handler) {
    stream.listen((value) {
      if (handler != null) {
        handler(value);
      }
    });
  }

  void dispose();
}

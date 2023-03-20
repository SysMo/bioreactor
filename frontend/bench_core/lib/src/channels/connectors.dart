import 'dart:async';
export 'dart:async' show StreamController;

import 'package:bench_core/src/messages/measurements.dart';

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

typedef Value = Object;
typedef OnValueFn<V> = void Function(V value);
typedef OnMeasurementValueFn<V> = void Function(Measurement<V> value);

abstract class ControlConnector<B extends ChannelBus> {
  void connectForwardChannels(B bus);
  void connectReverseChannels(B bus);
  void dispose();
}

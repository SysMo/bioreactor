import 'dart:async';

import 'package:bench_core/messages.dart';
import 'package:bench_core/mqtt.dart';
import 'package:bench_core/src/log.dart';
import 'measurement_channel.dart';

class ControlChannel<T, U> with Logging {
  TypedMeasurementChannel<T> readerChannel;
  late StreamController<U> actionController;
  bool actionsPaused = false;
  bool actionsHasSubscription = false;

  ControlChannel(this.readerChannel) {
    actionController = StreamController<U>(
      onListen: () {
        actionsHasSubscription = true;
      },
      onPause: () {
        actionsPaused = true;
      },
      onResume: () {
        actionsPaused = false;
      },
      onCancel: () {
        actionsHasSubscription = false;
      },
    );
  }

  Stream<U> controlStream() {
    return actionController.stream;
  }

  bool dispatch(U event) {
    if (actionsHasSubscription && !actionsPaused) {
      actionController.add(event);
      return true;
    } else {
      return false;
    }
  }
}

// class OnOffAction extends ControlAction {}

// class OnOffControlChannel extends ControlChannel<bool, OnOffAction> {
//   OnOffControlChannel(super.values);
// }
class ControlChannelCommunicator<T, U> {
  MqttService mqtt;
  String topic;
  ActionCodec<U> actionCodec;
  ControlChannelCommunicator(
      {required this.mqtt, required this.topic, required this.actionCodec});

  void deviceSide(ControlChannel<T, U> channel) {
    var readerCommunicator =
        MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/reader");
    readerCommunicator.deviceSide(channel.readerChannel);

    var actionConnector = ActionStreamMqttConnector<U>(
        mqtt: mqtt, topic: "$topic/actions", codec: actionCodec);
    actionConnector.receiver().listen((action) {
      channel.dispatch(action);
    });
  }

  ControlChannel<T, U> controlSide(T Function(Value) readerDecoder) {
    var readerCommunicator =
        MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/reader");
    var readerStream = readerCommunicator.controlSide<T>(readerDecoder);

    var instance = ControlChannel<T, U>(readerStream);
    var actionConnector = ActionStreamMqttConnector<U>(
        mqtt: mqtt, topic: "$topic/actions", codec: actionCodec);
    actionConnector.sender(instance.controlStream());
    return instance;
  }
}

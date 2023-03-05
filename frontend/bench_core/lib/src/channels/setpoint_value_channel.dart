import 'package:bench_core/messages.dart';
import 'package:bench_core/mqtt.dart';

import 'measurement_channel.dart';
import 'control_channel.dart';

abstract class SetpointValueChannelSource {
  double measure(double t);
}

class SetpointValueChannel {
  TypedMeasurementChannel<double> measurementChannel;
  ControlChannel<double, SetpointAction> controlChannel;

  SetpointValueChannel({
    required this.measurementChannel,
    required this.controlChannel,
  });
}

class SetpointChannelCommunicator {
  MqttService mqtt;
  String topic;
  SetpointChannelCommunicator({required this.mqtt, required this.topic});

  void deviceSide(SetpointValueChannel channel) {
    var measurementCommunicator =
        MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/measurement");
    var controlCommunicator = ControlChannelCommunicator(
        mqtt: mqtt,
        topic: "$topic/control",
        actionCodec: SetpointActionCodec());
    measurementCommunicator.deviceSide(channel.measurementChannel);
    controlCommunicator.deviceSide(channel.controlChannel);
  }

  SetpointValueChannel controlSide() {
    var measurementCommunicator =
        MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/measurement");
    var controlCommunicator =
        ControlChannelCommunicator<double, SetpointAction>(
            mqtt: mqtt,
            topic: "$topic/control",
            actionCodec: SetpointActionCodec());

    double decoder(Value v) => v.asReal() ?? (throw TypeError());

    return SetpointValueChannel(
        measurementChannel: measurementCommunicator.controlSide(decoder),
        controlChannel: controlCommunicator.controlSide(decoder));
  }
}

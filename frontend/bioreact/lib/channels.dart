import 'package:bench_core/channels.dart';
import 'package:bench_core/log.dart';
import 'package:bench_core/messages.dart';
import 'package:bench_core/mqtt.dart';
import 'package:bench_simulator/bench_simulator.dart';
// import 'package:async/async.dart';

class BioreactorChannels with Logging {
  TypedMeasurementChannel<double> uptimeChannel;
  SetpointValueChannel temperatureChannel;
  TypedMeasurementChannel<bool> heaterChannel;
  SetpointValueChannel stirrerSpeedChannel;
  TypedMeasurementChannel<double> dutyCycleChannel;

  BioreactorChannels({
    required this.uptimeChannel,
    required this.temperatureChannel,
    required this.heaterChannel,
    required this.stirrerSpeedChannel,
    required this.dutyCycleChannel,
  });

  void _applyDefaults() {
    uptimeChannel = uptimeChannel.withProps(
      label: "Uptime",
      formatter: FixedNumberFormatter(precision: 0),
      unit: "s",
    );

    temperatureChannel.measurementChannel =
        temperatureChannel.measurementChannel.withProps(
      label: "Temperature",
      formatter: FixedNumberFormatter(precision: 1),
      unit: "C",
    );

    heaterChannel =
        heaterChannel.withProps(label: "Heater", formatter: BooleanFormatter());

    stirrerSpeedChannel.measurementChannel =
        stirrerSpeedChannel.measurementChannel.withProps(
      label: "Stirrer speed",
      formatter: FixedNumberFormatter(precision: 0),
      unit: "rpm",
    );

    dutyCycleChannel = dutyCycleChannel.withProps(
      label: "PWM duty cycle",
      formatter: PercentFormatter(precision: 0),
      unit: "%",
    );
  }

  void deviceSide(MqttService mqtt, String topic) {
    MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/uptime")
        .deviceSide(uptimeChannel);
    SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/temperature")
        .deviceSide(temperatureChannel);
    MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/heater")
        .deviceSide(heaterChannel);
    SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/stirrer_speed")
        .deviceSide(stirrerSpeedChannel);
    MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/duty_cycle")
        .deviceSide(dutyCycleChannel);
  }

  factory BioreactorChannels.mqtt(MqttService mqtt, String topic) {
    double realDecoder(Value v) => v.asReal() ?? (throw TypeError());
    bool boolDecoder(Value v) => v.asBool() ?? (throw TypeError());

    var instance = BioreactorChannels(
      uptimeChannel:
          MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/uptime")
              .controlSide(realDecoder),
      temperatureChannel:
          SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/temperature")
              .controlSide(),
      heaterChannel:
          MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/heater")
              .controlSide(boolDecoder),
      stirrerSpeedChannel:
          SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/stirrer_speed")
              .controlSide(),
      dutyCycleChannel:
          MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/duty_cycle")
              .controlSide(realDecoder),
    );
    return instance;
  }

  factory BioreactorChannels.mockup({bool applyDefaults = true}) {
    ThermalMassSystem thermalMassSystem = ThermalMassSystem();
    DCServoMotor motor = DCServoMotor();
    var instance = BioreactorChannels(
      uptimeChannel: thermalMassSystem.timeUpChannel,
      temperatureChannel: thermalMassSystem.temperatureChannel,
      heaterChannel: thermalMassSystem.heaterChannel,
      stirrerSpeedChannel: motor.speedChannel,
      dutyCycleChannel: motor.dutyCycleChannel,
    );
    if (applyDefaults) {
      instance._applyDefaults();
    }

    return instance;
  }

  /// Mockup over MQTT
  /// ==========================================================================
  factory BioreactorChannels.mockupMqtt(MqttService mqtt,
      {bool applyDefaults = true}) {
    var topic = "sysmo/esp32/bio1";
    BioreactorChannels.mockup().deviceSide(mqtt, topic);
    var instance = BioreactorChannels.mqtt(mqtt, topic);
    if (applyDefaults) {
      instance._applyDefaults();
    }

    return instance;
  }
}

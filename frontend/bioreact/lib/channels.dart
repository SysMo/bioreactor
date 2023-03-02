import 'dart:convert';

import 'package:async/async.dart';
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

  factory BioreactorChannels.mockup_mqtt(MqttService mqtt,
      {bool applyDefaults = true}) {
    var instance = BioreactorChannels.mockup();

    instance.temperatureChannel.measurementChannel.values.listen((v) {
      var message = jsonEncode(
          MeasurementValue(sensor: "temperature", value: Value.real(v)));
      mqtt.publish("sysmo/esp32/bio1/sensors", message);
    });

    return BioreactorChannels.mqtt(mqtt);
  }

  factory BioreactorChannels.mqtt(MqttService mqtt) {
    const JsonDecoder jsonDecoder = JsonDecoder();

    Stream<MeasurementValue> subscriptionStream =
        mqtt.subscribeToTopic("sysmo/esp32/bio1/sensors").map((event) {
      return MeasurementValue.fromJson(jsonDecoder.convert(event));
    });
    StreamSplitter<MeasurementValue> splitter =
        StreamSplitter(subscriptionStream);
    var temperature = MeasurementChannel(splitter
            .split()
            .where((value) => value.sensor == "temperature")
            .map((value) => value.value)
            .asBroadcastStream())
        .asReal();

    splitter.close();

    temperature.values.listen((value) {
      print("Temperature is $temperature");
    });
    // Temporary
    return BioreactorChannels.mockup();
  }
}

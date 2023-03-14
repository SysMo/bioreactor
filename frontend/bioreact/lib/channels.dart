// import 'package:bench_core/channels.dart';
// import 'package:bench_core/log.dart';
// import 'package:bench_core/messages.dart';
// import 'package:bench_core/mqtt.dart';
// import 'package:bench_simulator/bench_simulator.dart';
// // import 'package:async/async.dart';

// class BioreactorChannels with Logging {
//   TypedMeasurementChannel<double> uptimeChannel;
//   SetpointValueChannel temperatureChannel;
//   TypedMeasurementChannel<bool> heaterChannel;
//   SetpointValueChannel stirrerSpeedChannel;
//   TypedMeasurementChannel<double> dutyCycleChannel;

//   FloatControlChannel onTimeChannel;
//   FloatControlChannel offTimeChannel;

//   BioreactorChannels({
//     required this.uptimeChannel,
//     required this.temperatureChannel,
//     required this.heaterChannel,
//     required this.stirrerSpeedChannel,
//     required this.dutyCycleChannel,
//     required this.onTimeChannel,
//     required this.offTimeChannel,
//   });

//   void _applyDefaults() {
//     uptimeChannel = uptimeChannel.withProps(
//       label: "Uptime",
//       formatter: FixedNumberFormatter(precision: 0),
//       unit: "s",
//     );

//     temperatureChannel.measurementChannel =
//         temperatureChannel.measurementChannel.withProps(
//       label: "Temperature",
//       formatter: FixedNumberFormatter(precision: 1),
//       unit: "C",
//     );

//     heaterChannel =
//         heaterChannel.withProps(label: "Heater", formatter: BooleanFormatter());

//     stirrerSpeedChannel.measurementChannel =
//         stirrerSpeedChannel.measurementChannel.withProps(
//       label: "Stirrer speed",
//       formatter: FixedNumberFormatter(precision: 0),
//       unit: "rpm",
//     );

//     dutyCycleChannel = dutyCycleChannel.withProps(
//       label: "PWM duty cycle",
//       formatter: PercentFormatter(precision: 0),
//       unit: "%",
//     );

//     onTimeChannel.readerChannel = onTimeChannel.readerChannel.withProps(
//       label: "Stirrer on time",
//       formatter: FixedNumberFormatter(precision: 0),
//       unit: "min",
//     );

//     offTimeChannel.readerChannel = offTimeChannel.readerChannel.withProps(
//       label: "Stirrer off time",
//       formatter: FixedNumberFormatter(precision: 0),
//       unit: "min",
//     );
//   }

//   void deviceSide(MqttService mqtt, String topic) {
//     MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/uptime")
//         .deviceSide(uptimeChannel);
//     SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/temperature")
//         .deviceSide(temperatureChannel);
//     MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/heater")
//         .deviceSide(heaterChannel);
//     SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/stirrer_speed")
//         .deviceSide(stirrerSpeedChannel);
//     MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/duty_cycle")
//         .deviceSide(dutyCycleChannel);
//     ControlChannelCommunicator<double, FloatValueAction>(
//             mqtt: mqtt,
//             topic: "$topic/on_time",
//             actionCodec: FloatValueAction.codec)
//         .deviceSide(onTimeChannel);
//     ControlChannelCommunicator<double, FloatValueAction>(
//             mqtt: mqtt,
//             topic: "$topic/off_time",
//             actionCodec: FloatValueAction.codec)
//         .deviceSide(offTimeChannel);
//   }

//   factory BioreactorChannels.mqtt(MqttService mqtt, String topic) {
//     double floatDecoder(Value v) => v.asReal() ?? (throw TypeError());
//     double floatDebugDecoder(Value v) {
//       print("Value: $v");
//       return v.asReal() ?? (throw TypeError());
//     }

//     bool boolDecoder(Value v) => v.asBool() ?? (throw TypeError());

//     var instance = BioreactorChannels(
//       uptimeChannel:
//           MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/uptime")
//               .controlSide(floatDecoder),
//       temperatureChannel:
//           SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/temperature")
//               .controlSide(),
//       heaterChannel:
//           MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/heater")
//               .controlSide(boolDecoder),
//       stirrerSpeedChannel:
//           SetpointChannelCommunicator(mqtt: mqtt, topic: "$topic/stirrer_speed")
//               .controlSide(),
//       dutyCycleChannel:
//           MeasurementChannelCommunicator(mqtt: mqtt, topic: "$topic/duty_cycle")
//               .controlSide(floatDecoder),
//       onTimeChannel: ControlChannelCommunicator<double, FloatValueAction>(
//               mqtt: mqtt,
//               topic: "$topic/on_time",
//               actionCodec: FloatValueAction.codec)
//           .controlSide(floatDebugDecoder),
//       offTimeChannel: ControlChannelCommunicator<double, FloatValueAction>(
//               mqtt: mqtt,
//               topic: "$topic/off_time",
//               actionCodec: FloatValueAction.codec)
//           .controlSide(floatDebugDecoder),
//     );
//     return instance;
//   }

//   factory BioreactorChannels.mockup({bool applyDefaults = true}) {
//     ThermalMassSystem thermalMassSystem = ThermalMassSystem();
//     StirrerModel motor = StirrerModel();
//     var instance = BioreactorChannels(
//       uptimeChannel: thermalMassSystem.timeUpChannel,
//       temperatureChannel: thermalMassSystem.temperatureChannel,
//       heaterChannel: thermalMassSystem.heaterChannel,
//       stirrerSpeedChannel: motor.speedChannel,
//       dutyCycleChannel: motor.dutyCycleChannel,
//       onTimeChannel: motor.onTimeControl.controlChannel,
//       offTimeChannel: motor.offTimeControl.controlChannel,
//     );
//     if (applyDefaults) {
//       instance._applyDefaults();
//     }

//     return instance;
//   }

//   /// Mockup over MQTT
//   /// ==========================================================================
//   factory BioreactorChannels.mockupMqtt(MqttService mqtt,
//       {bool applyDefaults = true}) {
//     var topic = "sysmo/esp32/bio1";
//     // Connect control side to Mqtt
//     var instance = BioreactorChannels.mqtt(mqtt, topic);
//     if (applyDefaults) {
//       instance._applyDefaults();
//     }
//     // Connect device side to Mqtt
//     BioreactorChannels.mockup().deviceSide(mqtt, topic);

//     return instance;
//   }
// }

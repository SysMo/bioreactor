import 'dart:async';

import 'package:bench_core/messages.dart';
import 'package:bench_core/channels.dart';
import 'package:bench_core/mqtt.dart';
import 'package:bioreact/model/bioreactor.dart';
import 'package:bioreact/model/thermal_mass.dart';
import 'package:bioreact/model/stirrer.dart';

double currentTime = 0;
const double tEps = 1e-3;
const double dt = 1.0;

// Device side
void bioreactorDeviceSide(MqttService mqtt) {
  var bioreactor = BioreactorModel();
  var connector = BioreactorDeviceConnector(bioreactor);
  var deviceBus = BioreactorBus();
  connector.connectForwardChannels(deviceBus);
  var deviceBusTree = deviceBus.deviceSideTree();
  mqtt.connectBus(deviceBus.deviceSideTree());
  connector.connectReverseChannels(deviceBus);

  Timer.periodic(
    Duration(milliseconds: (1000 * dt).toInt()),
    (timer) {
      bioreactor.advanceTime(currentTime, dt);
      currentTime += dt;
      print("t = $currentTime");
      connector.sample();
    },
  );
}

// Controller side
void bioreactorControllerSide(MqttService mqtt) {
  var clientBus = BioreactorBus();
  var bioreactorControl = BioreactorControlConnector(
    thermal: ThermalControlConnector(
      onTemperatureCurrentValue: (value) =>
          print("[thermal/temperature/current] $value"),
      onTemperatureTargetValue: (value) =>
          print("[thermal/temperature/target] $value"),
      onHeaterValue: (value) => print("[thermal/heater] $value"),
    ),
    stirrer: StirrerControlConnector(
      onDutyCycleValue: (value) => print("[stirrer/duty_cycle] $value"),
      onSpeedCurrentValue: (value) => print("[stirrer/speed/current] $value"),
      onSpeedTargetValue: (value) => print("[stirrer/speed/target] $value"),
      onOnTimeValue: (value) => print("[stirrer/on_time] $value"),
      onOffTimeValue: (value) => print("[stirrer/off_time] $value"),
    ),
  );

  bioreactorControl.connectReverseChannels(clientBus);
  mqtt.connectBus(clientBus.controlSideTree());
  bioreactorControl.connectForwardChannels(clientBus);

  bioreactorControl.stirrer.onTime
      .dispatch(const SetValueAction.setValue(10.0));
  bioreactorControl.stirrer.offTime
      .dispatch(const SetValueAction.setValue(5.0));
  bioreactorControl.thermal.temperature.targetConnector
      .dispatch(const SetValueAction.setValue(30.0));

  Timer.periodic(Duration(milliseconds: 2000), (timer) {
    double time = timer.tick.toDouble();
    bioreactorControl.stirrer.speed.targetConnector
        .dispatch(SetValueAction.setValue(time));
  });
}

void main() async {
  print("Start testing");
  var mqtt = MqttService.configure(
      url: "c0a7164f.ala.us-east-1.emqxsl.com",
      username: "sysmo",
      password: "sysmopass",
      clientId: "bio_app");
  await mqtt.connect();
  bioreactorDeviceSide(mqtt);
  bioreactorControllerSide(mqtt);
  print("Done testing");
}

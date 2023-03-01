import "dart:async";

import 'package:bench_core/channels.dart';
import 'package:bench_core/log.dart';
import 'package:bench_core/messages.dart';
import 'sampler.dart';

class ThermalMassSystem with Logging {
  double temperature;
  double targetTemperature;
  double temperatureTolerance = 1.0;
  double heatCapacity;
  double heaterPower;
  double heatLossConv = 10.0;
  double ambientTemperature = 20.0;
  bool heaterOn = false;

  double tCurrent = 0;
  double tEps = 1e-6;

  late SetpointValueChannel temperatureChannel;
  late TypedMeasurementChannel<double> timeUpChannel;
  late OnOffControlChannel heaterChannel;
  StreamController<double> temperatureTargetChannelController =
      StreamController<double>();

  ThermalMassSystem({
    this.heatCapacity = 1000.0,
    this.heaterPower = 1000.0,
    double initTemperature = 20,
    double initTargetTemperature = 35,
  })  : temperature = initTemperature,
        targetTemperature = initTargetTemperature {
    timeUpChannel = Sampler.typed((t) => t);

    temperatureChannel = SetpointValueChannel(
        measurementChannel: Sampler.typed((t) {
          advanceTime(t);
          return temperature;
        }),
        setpointChannel: ControlChannel(TypedMeasurementChannel(
            temperatureTargetChannelController.stream)));
    temperatureChannel.setpointChannel
        .controlStream()
        .listen(onTemperatureCommand);

    heaterChannel = OnOffControlChannel(Sampler.typed((t) => heaterOn));
    heaterChannel.controlStream().listen(onHeaterCommand);
  }

  void onTemperatureCommand(SetpointAction command) {
    if (command is SetTarget) {
      targetTemperature = command.value;
    } else if (command is ReadTarget &&
        temperatureTargetChannelController.hasListener) {
      temperatureTargetChannelController.add(targetTemperature);
    } else {
      logger.w("Unknown command $command");
    }
  }

  void onHeaterCommand(OnOffAction command) {
    // print("Got heater command: $command");
  }

  // @override
  void advanceTime(double t) {
    var dt = t - tCurrent;
    // Compute new state
    if (dt > tEps) {
      if ((temperature < targetTemperature - temperatureTolerance) &&
          !heaterOn) {
        heaterOn = true;
        logger.i("Turning heater on");
      } else if ((temperature > targetTemperature + temperatureTolerance) &&
          heaterOn) {
        heaterOn = false;
        logger.i("Turning heater off");
      }
      double qDot = (heaterOn ? heaterPower : 0.0) -
          heatLossConv * (temperature - ambientTemperature);
      temperature += qDot / heatCapacity * dt;

      // Update current time
      tCurrent = t;
    }
  }
}

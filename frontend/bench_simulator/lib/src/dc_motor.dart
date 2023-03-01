import 'dart:async';

import 'package:bench_core/channels.dart';
import 'package:bench_core/log.dart';
import 'sampler.dart';

class DCServoMotor with Logging {
  double omega = 0.0;
  double omegaTarget = 0.0;
  double dutyCycle = 0.0;

  double kInertial = 1e-3;
  double kOmega = 3e3;
  double kProp = 1e-4;

  double tCurrent = 0.0;
  double tEps = 1e-3;

  late SetpointValueChannel speedChannel;
  late TypedMeasurementChannel<double> dutyCycleChannel;
  StreamController<double> omegaTargetChannelController =
      StreamController<double>();

  DCServoMotor() {
    speedChannel = SetpointValueChannel(
      measurementChannel: Sampler.typed((t) {
        advanceTime(t);
        return omega;
      }),
      setpointChannel: ControlChannel(
          TypedMeasurementChannel(omegaTargetChannelController.stream)),
    );

    speedChannel.setpointChannel.controlStream().listen(onSpeedCommand);

    dutyCycleChannel = Sampler.typed((t) => dutyCycle);
  }

  void onSpeedCommand(SetpointAction command) {
    if (command is SetTarget) {
      omegaTarget = command.value;
    } else if (command is ReadTarget &&
        omegaTargetChannelController.hasListener) {
      omegaTargetChannelController.add(omegaTarget);
    } else {
      logger.w("Unknown command: $command");
    }
  }

  void advanceTime(double t) {
    double dt = t - tCurrent;
    if (dt > tEps) {
      // Compute new state
      dutyCycle += kProp * (omegaTarget - omega);
      if (dutyCycle < 0.0) {
        dutyCycle = 0.0;
      } else if (dutyCycle > 1.0) {
        dutyCycle = 1.0;
      }

      omega += 1.0 / kInertial * (dutyCycle - omega / kOmega);
      // Update current time
      tCurrent = t;
    }
  }
}

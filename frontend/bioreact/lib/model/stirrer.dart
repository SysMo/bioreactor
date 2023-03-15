import 'package:bench_core/channels.dart';
import 'package:bench_core/log.dart';

class StirrerModel with Logging {
  double omega = 0.0;
  double omegaTarget = 100.0;
  double dutyCycle = 0.0;

  double kInertial = 1e-3;
  double kOmega = 3e3;
  double kProp = 1e-4;

  double tCurrent = 0.0;

  double tOn = 1000.0;
  double tOff = 0.0;
  double tLastSwitch = 0.0;
  bool isOn = true;

  void advanceTime(double tLast, double dt) {
    double tCurrent = tLast + dt;

    if (isOn && (tCurrent - tLastSwitch > tOn) && (tOff > 0)) {
      isOn = false;
      tLastSwitch = tCurrent;
    } else if (!isOn && (tCurrent - tLastSwitch > tOff)) {
      isOn = true;
      tLastSwitch = tCurrent;
    }

    // Compute new state
    if (isOn) {
      dutyCycle += kProp * (omegaTarget - omega) * dt;
      if (dutyCycle < 0.0) {
        dutyCycle = 0.0;
      } else if (dutyCycle > 1.0) {
        dutyCycle = 1.0;
      }
    } else {
      dutyCycle = 0.0;
    }

    omega += 1.0 / kInertial * (dutyCycle - omega / kOmega) * dt;
  }
}

// typedef FloatValueAction = SetValueAction<double>;

class StirrerBus extends ChannelBus {
  MeasurementChannel<double> dutyCycle;
  SetPointChannel speed;
  SetValueChannel<double> onTime;
  SetValueChannel<double> offTime;

  StirrerBus._({
    required this.dutyCycle,
    required this.speed,
    required this.onTime,
    required this.offTime,
  });

  factory StirrerBus() {
    var instance = StirrerBus._(
      dutyCycle: MeasurementChannel(id: "duty_cycle"),
      speed: SetPointChannel(id: "speed"),
      onTime: SetValueChannel(id: "on_time"),
      offTime: SetValueChannel(id: "off_time"),
    );
    return instance;
  }

  @override
  String get busId => "stirrer";

  @override
  List<ChannelBus> get children => [dutyCycle, speed, onTime, offTime];
}

class StirrerDeviceConnector extends DeviceConnector<StirrerBus> {
  StirrerModel device;
  SetPointDeviceConnector speed;
  MeasurementDeviceConnector<double> dutyCycle;
  SetValueDeviceConnector<double> onTime;
  SetValueDeviceConnector<double> offTime;

  StirrerDeviceConnector._(
    this.device, {
    required this.speed,
    required this.dutyCycle,
    required this.onTime,
    required this.offTime,
  });

  factory StirrerDeviceConnector(StirrerModel device) {
    var speedConnector = SetPointDeviceConnector.fn(
      currentValueReader: () => device.omega,
      targetValueReader: () => device.omegaTarget,
      targetValueWriter: (v) => device.omegaTarget = v,
    );

    var dutyCycleConnector =
        MeasurementDeviceConnector<double>(() => device.dutyCycle);

    var onTimeConnector = SetValueDeviceConnector<double>.fn(
      valueReader: () => device.tOn,
      valueWriter: (v) => device.tOn = v,
    );

    var offTimeConnector = SetValueDeviceConnector<double>.fn(
      valueReader: () => device.tOff,
      valueWriter: (v) => device.tOff = v,
    );

    return StirrerDeviceConnector._(device,
        speed: speedConnector,
        dutyCycle: dutyCycleConnector,
        onTime: onTimeConnector,
        offTime: offTimeConnector);
  }

  @override
  void sample() {
    speed.sample();
    dutyCycle.sample();
  }

  @override
  void connectForwardChannels(StirrerBus bus) {
    dutyCycle.connectForwardChannels(bus.dutyCycle);
    speed.connectForwardChannels(bus.speed);
    onTime.connectForwardChannels(bus.onTime);
    offTime.connectForwardChannels(bus.offTime);
  }

  @override
  void connectReverseChannels(StirrerBus bus) {
    speed.connectReverseChannels(bus.speed);
    onTime.connectReverseChannels(bus.onTime);
    offTime.connectReverseChannels(bus.offTime);
  }
}

class StirrerControlConnector extends ControlConnector<StirrerBus> {
  MeasurementControlConnector<double> dutyCycle;
  SetPointControlConnector speed;
  SetValueControlConnector<double> onTime;
  SetValueControlConnector<double> offTime;

  StirrerControlConnector({
    Function(double value)? onDutyCycleValue,
    Function(double value)? onSpeedCurrentValue,
    Function(double value)? onSpeedTargetValue,
    Function(double value)? onOnTimeValue,
    Function(double value)? onOffTimeValue,
  })  : dutyCycle = MeasurementControlConnector<double>(onDutyCycleValue),
        speed = SetPointControlConnector(
            onCurrentValue: onSpeedCurrentValue,
            onTargetReadValue: onSpeedTargetValue),
        onTime = SetValueControlConnector<double>(onOnTimeValue),
        offTime = SetValueControlConnector<double>(onOffTimeValue) {
    speed.currentConnector.configure(
        label: "Stirrer speed", unit: "rpm", formatter: FloatFormatter());
    dutyCycle.configure(label: "Motor load", formatter: PercentFormatter());
  }

  @override
  void connectForwardChannels(StirrerBus bus) {
    speed.connectForwardChannels(bus.speed);
    dutyCycle.connectForwardChannels(bus.dutyCycle);
    onTime.connectForwardChannels(bus.onTime);
    offTime.connectForwardChannels(bus.offTime);
  }

  @override
  void connectReverseChannels(StirrerBus bus) {
    speed.connectReverseChannels(bus.speed);
    onTime.connectReverseChannels(bus.onTime);
    offTime.connectReverseChannels(bus.offTime);
  }

  @override
  void dispose() {
    dutyCycle.dispose();
    speed.dispose();
    onTime.dispose();
    offTime.dispose();
  }
}

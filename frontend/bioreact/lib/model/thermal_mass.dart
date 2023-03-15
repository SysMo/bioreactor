import 'package:bench_core/channels.dart';
import 'package:bench_core/log.dart';

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

  ThermalMassSystem({
    this.heatCapacity = 1000.0,
    this.heaterPower = 1000.0,
    double initTemperature = 25,
    double initTargetTemperature = 35,
  })  : temperature = initTemperature,
        targetTemperature = initTargetTemperature;

  // @override
  void advanceTime(double tLast, double dt) {
    // double tCurrent = tLast + dt;

    // Compute new state
    if ((temperature < targetTemperature - temperatureTolerance) && !heaterOn) {
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
  }
}

class ThermalBus extends ChannelBus {
  SetPointChannel temperature;
  MeasurementChannel<bool> heater;
  ThermalBus._({
    required this.temperature,
    required this.heater,
  });

  factory ThermalBus() {
    return ThermalBus._(
      temperature: SetPointChannel(id: "temperature"),
      heater: MeasurementChannel(id: "heater"),
    );
  }

  @override
  String get busId => "thermal";

  @override
  List<ChannelBus> get children => [temperature, heater];
}

class ThermalDeviceConnector extends DeviceConnector<ThermalBus> {
  ThermalMassSystem device;
  SetPointDeviceConnector temperature;
  MeasurementDeviceConnector<bool> heater;

  ThermalDeviceConnector._(
    this.device, {
    required this.temperature,
    required this.heater,
  });

  factory ThermalDeviceConnector(ThermalMassSystem device) {
    var temperatureConnector = SetPointDeviceConnector.fn(
      currentValueReader: () => device.temperature,
      targetValueReader: () => device.targetTemperature,
      targetValueWriter: (v) => device.targetTemperature = v,
    );

    var heaterConnector = MeasurementDeviceConnector(
      () => device.heaterOn,
    );

    return ThermalDeviceConnector._(
      device,
      temperature: temperatureConnector,
      heater: heaterConnector,
    );
  }

  @override
  void sample() {
    temperature.sample();
    heater.sample();
  }

  @override
  void connectForwardChannels(ThermalBus bus) {
    temperature.connectForwardChannels(bus.temperature);
    heater.connectForwardChannels(bus.heater);
  }

  @override
  void connectReverseChannels(ThermalBus bus) {
    temperature.connectReverseChannels(bus.temperature);
  }
}

class ThermalControlConnector extends ControlConnector<ThermalBus> {
  SetPointControlConnector temperature;
  MeasurementControlConnector<bool> heater;
  ThermalControlConnector({
    Function(double value)? onTemperatureCurrentValue,
    Function(double value)? onTemperatureTargetValue,
    Function(bool value)? onHeaterValue,
  })  : temperature = SetPointControlConnector(
          onCurrentValue: onTemperatureCurrentValue,
          onTargetReadValue: onTemperatureTargetValue,
        ),
        heater = MeasurementControlConnector<bool>(onHeaterValue) {
    temperature.currentConnector.configure(
        label: "Temperature", unit: "degC", formatter: FloatFormatter());

    heater.configure(label: "Heater", formatter: OnOffFormatter());
  }

  @override
  void connectForwardChannels(ThermalBus bus) {
    temperature.connectForwardChannels(bus.temperature);
    heater.connectForwardChannels(bus.heater);
  }

  @override
  void connectReverseChannels(ThermalBus bus) {
    temperature.connectReverseChannels(bus.temperature);
  }

  @override
  void dispose() {
    temperature.dispose();
    heater.dispose();
  }
}

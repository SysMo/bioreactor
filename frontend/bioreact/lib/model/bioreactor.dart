import 'package:bench_core/channels.dart';
import 'package:bench_core/mqtt.dart';
import 'dart:async';
import 'thermal_mass.dart';
import 'stirrer.dart';

class BioreactorModel {
  ThermalMassSystem thermal = ThermalMassSystem();
  StirrerModel stirrer = StirrerModel();

  void advanceTime(double tLast, double dt) {
    thermal.advanceTime(tLast, dt);
    stirrer.advanceTime(tLast, dt);
  }
}

class BioreactorBus extends ChannelBus {
  ThermalBus thermal;
  StirrerBus stirrer;

  BioreactorBus._({
    required this.thermal,
    required this.stirrer,
  });

  factory BioreactorBus() {
    var instance = BioreactorBus._(
      thermal: ThermalBus(),
      stirrer: StirrerBus(),
    );
    return instance;
  }

  @override
  String get busId => "bioreactor";

  @override
  List<ChannelBus> get children => [thermal, stirrer];
}

class BioreactorDeviceConnector extends DeviceConnector<BioreactorBus> {
  BioreactorModel device;
  ThermalDeviceConnector thermal;
  StirrerDeviceConnector stirrer;

  BioreactorDeviceConnector._(
    this.device, {
    required this.thermal,
    required this.stirrer,
  });

  factory BioreactorDeviceConnector(BioreactorModel device) {
    var thermalConnector = ThermalDeviceConnector(device.thermal);
    var stirrerConnector = StirrerDeviceConnector(device.stirrer);

    return BioreactorDeviceConnector._(
      device,
      thermal: thermalConnector,
      stirrer: stirrerConnector,
    );
  }

  factory BioreactorDeviceConnector.mockupMqtt(MqttService mqtt) {
    double currentTime = 0;
    // const double tEps = 1e-3;
    const double dt = 1.0;

    var bioreactor = BioreactorModel();
    var connector = BioreactorDeviceConnector(bioreactor);
    var deviceBus = BioreactorBus();
    connector.connectForwardChannels(deviceBus);
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

    return connector;
  }

  @override
  void connectForwardChannels(BioreactorBus bus) {
    thermal.connectForwardChannels(bus.thermal);
    stirrer.connectForwardChannels(bus.stirrer);
  }

  @override
  void connectReverseChannels(BioreactorBus bus) {
    thermal.connectReverseChannels(bus.thermal);
    stirrer.connectReverseChannels(bus.stirrer);
  }

  @override
  void sample() {
    thermal.sample();
    stirrer.sample();
  }
}

class BioreactorControlConnector extends ControlConnector<BioreactorBus> {
  ThermalControlConnector thermal;
  StirrerControlConnector stirrer;

  BioreactorControlConnector({required this.thermal, required this.stirrer});

  factory BioreactorControlConnector.empty() {
    return BioreactorControlConnector(
      stirrer: StirrerControlConnector(),
      thermal: ThermalControlConnector(),
    );
  }

  @override
  void connectForwardChannels(BioreactorBus bus) {
    thermal.connectForwardChannels(bus.thermal);
    stirrer.connectForwardChannels(bus.stirrer);
  }

  @override
  void connectReverseChannels(BioreactorBus bus) {
    thermal.connectReverseChannels(bus.thermal);
    stirrer.connectReverseChannels(bus.stirrer);
  }

  @override
  void dispose() {
    thermal.dispose();
    stirrer.dispose();
  }
}

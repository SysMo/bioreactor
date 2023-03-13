import 'package:bench_core/channels.dart';

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
}

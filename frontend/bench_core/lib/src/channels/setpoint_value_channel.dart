import 'measurement_channel.dart';
import 'control_channel.dart';

class SetpointAction extends ControlAction {}

class SetTarget extends SetpointAction {
  double value;
  SetTarget(this.value);
}

class ReadTarget extends SetpointAction {}

abstract class SetpointValueChannelSource {
  double measure(double t);
}

class SetpointValueChannel {
  TypedMeasurementChannel<double> measurementChannel;
  ControlChannel<double, SetpointAction> setpointChannel;

  SetpointValueChannel({
    required this.measurementChannel,
    required this.setpointChannel,
  });
}

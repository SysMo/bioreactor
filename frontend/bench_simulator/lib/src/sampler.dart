import 'package:bench_communication/channels.dart';

class Sampler {
  static Stream<T> periodicStream<T>(T Function(double) f) {
    return Stream.periodic(const Duration(milliseconds: 100), (count) {
      double t = count.toDouble() / 10.0;
      return f(t);
    });
  }

  static MeasurementChannel<T> periodicMeasurement<T>(T Function(double) f) {
    return MeasurementChannel(periodicStream(f));
  }
}

// import 'package:bench_core/channels.dart';
// import 'package:bench_core/messages.dart';

// class Sampler {
//   static const double step = 1.0;
//   static Stream<T> periodicStream<T>(T Function(double) f) {
//     return Stream.periodic(Duration(milliseconds: (step * 1000).toInt()),
//         (count) {
//       double t = count.toDouble() * step;
//       return f(t);
//     });
//   }

//   static MeasurementChannel untyped(String id, Value Function(double) f,
//       {bool broadcast = true}) {
//     var result = MeasurementChannel(id, periodicStream(f));
//     if (broadcast) {
//       result = result.asBroadcast();
//     }
//     return result;
//   }

//   static TypedMeasurementChannel<T> typed<T>(String id, T Function(double) f,
//       {bool broadcast = true}) {
//     var result = TypedMeasurementChannel(id, periodicStream(f));
//     if (broadcast) {
//       result = result.asBroadcast();
//     }
//     return result;
//   }
// }

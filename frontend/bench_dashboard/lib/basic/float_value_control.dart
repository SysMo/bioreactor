// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// class FloatValueControl extends StatefulWidget {
//   final String title;
//   final double minimum;
//   final double maximum;
//   final Stream<double> measurementStream;
//   final Stream<double> controlStream;

//   const FloatValueControl(
//       {super.key,
//       required this.title,
//       required this.measurementStream,
//       required this.controlStream,
//       this.minimum = 0.0,
//       this.maximum = 100.0});

//   @override
//   State<FloatValueControl> createState() => _FloatValueControlState();
// }

// class _FloatValueControlState extends State<FloatValueControl> {
//   double? measuredValue;
//   double? targetValue;

//   @override
//   void initState() {
//     print("Init state float value");
//     super.initState();
//     widget.measurementStream.listen((event) {
//       setState(() {
//         measuredValue = event;
//       });
//     });

//     widget.controlStream.listen((event) {
//       setState(() {
//         targetValue = event;
//       });
//     });
//   }

//   void onValueChanging(ValueChangingArgs args) {
//     setState(() {
//       targetValue = args.value;
//     });
//   }

//   void onvalueChanged(double value) {
//     print("Changed $value");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       child: SfRadialGauge(
//           title: GaugeTitle(
//               text: widget.title,
//               textStyle:
//                   const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
//           axes: <RadialAxis>[
//             RadialAxis(
//               minimum: widget.minimum,
//               maximum: widget.maximum,
//               pointers: <GaugePointer>[
//                 MarkerPointer(
//                     value: targetValue ?? 0,
//                     enableDragging: true,
//                     onValueChanging: onValueChanging,
//                     onValueChanged: onvalueChanged),
//                 NeedlePointer(value: measuredValue ?? 0, needleEndWidth: 5)
//               ],
//             )
//           ]),
//     );
//   }
// }

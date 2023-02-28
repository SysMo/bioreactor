import 'package:flutter/material.dart';
import 'package:bench_communication/channels.dart';
import 'package:sprintf/sprintf.dart';

class FloatValueReadout extends StatefulWidget {
  final String title;
  final MeasurementChannel<double> measurementChannel;

  const FloatValueReadout({
    super.key,
    required this.title,
    required this.measurementChannel,
  });

  @override
  State<FloatValueReadout> createState() => _FloatValueReadoutState();
}

class _FloatValueReadoutState extends State<FloatValueReadout> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.title, textScaleFactor: 1.5),
      StreamBuilder<double>(
          stream: widget.measurementChannel.values,
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
            var formatted =
                snapshot.hasData ? sprintf("%2.2f", [snapshot.data]) : "N/A";

            return Center(
                child: Text(
              formatted,
              textScaleFactor: 2,
            ));
          })
    ]);
  }
}

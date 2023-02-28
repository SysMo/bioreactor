import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bench_communication/channels.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SetpointValueControl extends StatefulWidget {
  final String title;
  final double minimum;
  final double maximum;
  final SetpointValueChannel channel;

  const SetpointValueControl(
      {super.key,
      required this.title,
      required this.channel,
      this.minimum = 0.0,
      this.maximum = 100.0});

  @override
  State<SetpointValueControl> createState() => _SetpointValueControlState();
}

class _SetpointValueControlState extends State<SetpointValueControl> {
  double? measuredValue;
  double? targetValue;
  late StreamController<SetpointAction> setpointController;

  @override
  void initState() {
    super.initState();

    widget.channel.measurementChannel.values.listen((event) {
      setState(() {
        measuredValue = event;
      });
    });

    widget.channel.setpointChannel.values.listen((event) {
      setState(() {
        targetValue = event;
      });
    });

    widget.channel.setpointChannel.dispatch(ReadTarget());
  }

  void onvalueChanged(double value) {
    widget.channel.setpointChannel.dispatch(SetTarget(value));
    setState(() {
      targetValue = value;
    });
  }

  void onTargetChangeEnd(double newValue) {
    widget.channel.setpointChannel.dispatch(ReadTarget());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SfRadialGauge(
          title: GaugeTitle(
              text: widget.title,
              textStyle:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          axes: <RadialAxis>[
            RadialAxis(
              minimum: widget.minimum,
              maximum: widget.maximum,
              pointers: <GaugePointer>[
                MarkerPointer(
                  value: targetValue ?? 0,
                  enableDragging: true,
                  onValueChanged: onvalueChanged,
                  onValueChangeEnd: onTargetChangeEnd,
                ),
                NeedlePointer(value: measuredValue ?? 0, needleEndWidth: 5)
              ],
            )
          ]),
    );
  }
}
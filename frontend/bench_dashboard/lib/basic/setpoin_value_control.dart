import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bench_core/channels.dart';
import 'package:bench_core/messages.dart';
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
  double? setpointValue;

  late StreamSubscription measurementSubscription;
  late StreamSubscription setpointSubscription;

  @override
  void initState() {
    super.initState();

    var spChannel = widget.channel;

    measurementSubscription =
        spChannel.measurementChannel.values.listen((event) {
      setState(() {
        measuredValue = event;
      });
    });

    setpointSubscription =
        spChannel.controlChannel.readerChannel.values.listen((event) {
      setState(() {
        setpointValue = event;
      });
    });

    widget.channel.controlChannel.dispatch(const ReadTarget());
  }

  @override
  void dispose() {
    measurementSubscription.cancel();
    setpointSubscription.cancel();
    super.dispose();
  }

  void onvalueChanged(double value) {
    widget.channel.controlChannel.dispatch(SetTarget(value));
    setState(() {
      setpointValue = value;
    });
  }

  void onTargetChangeEnd(double newValue) {
    widget.channel.controlChannel.dispatch(const ReadTarget());
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
                  value: setpointValue ?? 0,
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

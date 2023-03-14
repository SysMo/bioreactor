import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:bench_core/channels.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SetPointWidget extends StatefulWidget {
  final String title;
  final double minimum;
  final double maximum;
  final SetPointControlConnector connector;

  const SetPointWidget(
      {super.key,
      required this.title,
      required this.connector,
      this.minimum = 0.0,
      this.maximum = 100.0});

  @override
  State<SetPointWidget> createState() => _SetPointWidgetState();
}

class _SetPointWidgetState extends State<SetPointWidget> {
  double? measuredValue;
  double? setpointValue;

  @override
  void initState() {
    super.initState();

    widget.connector.currentConnector.setOnValue((v) => setState(() {
          measuredValue = v;
        }));

    widget.connector.targetConnector.setOnReadValue((v) => setState(() {
          setpointValue = v;
        }));

    widget.connector.targetConnector.readValue();
  }

  @override
  void dispose() {
    widget.connector.dispose();
    super.dispose();
  }

  void onvalueChanged(double value) {
    setState(() {
      setpointValue = value;
    });
  }

  void onTargetChangeEnd(double newValue) {
    widget.connector.targetConnector.setValue(newValue);
    // Redundant
    // widget.connector.targetConnector.readValue();
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

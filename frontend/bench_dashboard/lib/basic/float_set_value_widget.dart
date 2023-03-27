import 'package:bench_core/channels.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FloatSetValueWidget extends StatefulWidget {
  final String title;
  final double minimum;
  final double maximum;
  final SetValueControlConnector<double> connector;

  const FloatSetValueWidget(
      {super.key,
      required this.title,
      required this.connector,
      this.minimum = 0.0,
      this.maximum = 100.0});

  @override
  State<FloatSetValueWidget> createState() => _FloatSetValueWidgetState();
}

class _FloatSetValueWidgetState extends State<FloatSetValueWidget> {
  double? value;

  @override
  void initState() {
    super.initState();

    widget.connector.setOnReadValue((m) => setState(() {
          value = m.value;
        }));
    widget.connector.readValue();
  }

  @override
  void dispose() {
    widget.connector.dispose();
    super.dispose();
  }

  void onvalueChanged(double v) {
    setState(() {
      value = v;
    });
  }

  void onTargetChangeEnd(double newValue) {
    widget.connector.setValue(newValue);
    // Redundant
    // widget.connector.readValue();
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
                  value: value ?? 0,
                  enableDragging: true,
                  onValueChanged: onvalueChanged,
                  onValueChangeEnd: onTargetChangeEnd,
                ),
              ],
            )
          ]),
    );
  }
}

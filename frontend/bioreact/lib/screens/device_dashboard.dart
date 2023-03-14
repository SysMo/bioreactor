import '../model/bioreactor.dart';
import 'package:flutter/material.dart';
import 'package:bench_dashboard/basic.dart';
// import 'package:bench_dashboard/composite.dart';
import 'package:bench_dashboard/layouts.dart';

class DeviceDashboard extends StatefulWidget {
  // Props
  final BioreactorControlConnector connector;

  const DeviceDashboard({super.key, required this.connector});

  @override
  State<DeviceDashboard> createState() => _DeviceDashboardState();
}

class _DeviceDashboardState extends State<DeviceDashboard> {
  _DeviceDashboardState();

  @override
  Widget build(BuildContext context) {
    var connector = widget.connector;
    return DashboardLayout(
      children: [
        // StatusOverwiew(channels: [
        //   channels.uptimeChannel.asUntyped(),
        //   channels.temperatureChannel.measurementChannel.asUntyped(),
        //   channels.heaterChannel.asUntyped(),
        //   channels.stirrerSpeedChannel.measurementChannel.asUntyped(),
        //   channels.dutyCycleChannel.asUntyped(),
        // ]),
        SetPointWidget(
          title: "Temperature [C]",
          connector: connector.thermal.temperature,
          minimum: 30,
          maximum: 40,
        ),
        SetPointWidget(
          title: "Motor speed [RPM]",
          connector: connector.stirrer.speed,
          minimum: 0,
          maximum: 300,
        ),
        FloatSetValueWidget(
          title: "Stirrer On time [min]",
          connector: connector.stirrer.onTime,
          minimum: 0,
          maximum: 100,
        ),
        FloatSetValueWidget(
          title: "Stirrer Off time [min]",
          connector: connector.stirrer.offTime,
          minimum: 0,
          maximum: 100,
        )
      ],
    );
  }
}

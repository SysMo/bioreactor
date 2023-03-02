import 'package:flutter/material.dart';
import 'package:bench_dashboard/basic.dart';
import 'package:bench_dashboard/composite.dart';
import 'package:bench_dashboard/layouts.dart';
import '../channels.dart';

class DeviceDashboard extends StatefulWidget {
  // Props
  final BioreactorChannels channels;

  const DeviceDashboard({super.key, required this.channels});

  @override
  State<DeviceDashboard> createState() => _DeviceDashboardState();
}

class _DeviceDashboardState extends State<DeviceDashboard> {
  _DeviceDashboardState();

  @override
  Widget build(BuildContext context) {
    var channels = widget.channels;
    return DashboardLayout(
      children: [
        StatusOverwiew(channels: [
          channels.uptimeChannel.asUntyped(),
          channels.temperatureChannel.measurementChannel.asUntyped(),
          channels.heaterChannel.asUntyped(),
          channels.stirrerSpeedChannel.measurementChannel.asUntyped(),
          channels.dutyCycleChannel.asUntyped(),
        ]),
        SetpointValueControl(
          title: "Temperature [C]",
          channel: channels.temperatureChannel,
          minimum: 30,
          maximum: 40,
        ),
        SetpointValueControl(
          title: "Motor speed [RPM]",
          channel: channels.stirrerSpeedChannel,
          minimum: 0,
          maximum: 2000,
        ),
      ],
    );
  }
}

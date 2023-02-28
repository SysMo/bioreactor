import 'package:flutter/material.dart';
import 'package:bench_simulator/bench_simulator.dart';
import 'package:bench_dashboard/basic.dart';
import '../services.dart';

class DeviceDashboard extends StatefulWidget {
  // Props
  final Services services;

  const DeviceDashboard({super.key, required this.services});

  @override
  State<DeviceDashboard> createState() => _DeviceDashboardState();
}

class _DeviceDashboardState extends State<DeviceDashboard> {
  ThermalMassSystem thermalMassSystem = ThermalMassSystem();
  DCServoMotor motor = DCServoMotor();

  _DeviceDashboardState();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatValueReadout(
            title: "Uptime [s]",
            measurementChannel: thermalMassSystem.timeUpChannel),
        SetpointValueControl(
          title: "Temperature [C]",
          channel: thermalMassSystem.temperatureChannel,
          minimum: 30,
          maximum: 40,
        ),
        OnOffValueControl(
            title: "Heater", channel: thermalMassSystem.heaterChannel),
        SetpointValueControl(
          title: "Motor speed [RPM]",
          channel: motor.speedChannel,
          minimum: 0,
          maximum: 2000,
        ),
        FloatValueReadout(
            title: "PWM duty []", measurementChannel: motor.dutyCycleChannel),
      ],
    );

    // return GridView.count(
    //   crossAxisCount: 1,
    //   childAspectRatio: 1.7,
    //   children: [
    //     Row(
    //       children: [
    //         FloatValueReadout(
    //             measurementChannel: thermalMassSystem.timeUpChannel),
    //         OnOffValueControl(
    //             title: "Heater", channel: thermalMassSystem.heaterChannel),
    //         // FloatValueReadout(
    //         //     measurementChannel:
    //         //         thermalMassSystem.temperatureChannel.measurementChannel),
    //       ],
    //     ),

    //     SetpointValueControl(
    //       title: "Temperature",
    //       channel: thermalMassSystem.temperatureChannel,
    //       minimum: 30,
    //       maximum: 40,
    //     ),
    //     // FloatValueControl(
    //     //   title: "Impeller speed",
    //     //   measuredValue: 800,
    //     //   minimum: 0,
    //     //   maximum: 1500,
    //     // ),
    //   ],
    // );
  }
}

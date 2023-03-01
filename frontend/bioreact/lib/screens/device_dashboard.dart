import 'package:flutter/material.dart';
import 'package:bench_simulator/bench_simulator.dart';
import 'package:bench_core/channels.dart';
import 'package:bench_dashboard/basic.dart';
import 'package:bench_dashboard/composite.dart';
import 'package:bench_dashboard/layouts.dart';
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
    var temperatureMeasurementChannel =
        thermalMassSystem.temperatureChannel.measurementChannel.withProps(
      label: "Temperature",
      formatter: FixedNumberFormatter(precision: 1),
      unit: "C",
    );

    var timeUpChannel = thermalMassSystem.timeUpChannel.withProps(
      label: "Uptime",
      formatter: FixedNumberFormatter(precision: 0),
      unit: "s",
    );

    var heaterOnChannel = thermalMassSystem.heaterChannel.measurementChannel
        .withProps(label: "Heater", formatter: BooleanFormatter());

    var stirrerSpeedMeasurementChannel =
        motor.speedChannel.measurementChannel.withProps(
      label: "Stirrer speed",
      formatter: FixedNumberFormatter(precision: 0),
      unit: "rpm",
    );

    var dutyCycleChannel = motor.dutyCycleChannel.withProps(
      label: "PWM duty cycle",
      formatter: PercentFormatter(precision: 0),
      unit: "%",
    );

    return DashboardLayout(
      children: [
        StatusOverwiew(channels: [
          timeUpChannel.asUntyped(),
          temperatureMeasurementChannel.asUntyped(),
          heaterOnChannel.asUntyped(),
          stirrerSpeedMeasurementChannel.asUntyped(),
          dutyCycleChannel.asUntyped(),
        ]), // FloatValueReadout(
        //     title: "Uptime [s]",
        //     measurementChannel: thermalMassSystem.timeUpChannel),
        SetpointValueControl(
          title: "Temperature [C]",
          channel: thermalMassSystem.temperatureChannel,
          minimum: 30,
          maximum: 40,
        ),
        // OnOffValueControl(
        //     title: "Heater", channel: thermalMassSystem.heaterChannel),
        SetpointValueControl(
          title: "Motor speed [RPM]",
          channel: motor.speedChannel,
          minimum: 0,
          maximum: 2000,
        ),
        // FloatValueReadout(
        //     title: "PWM duty []", measurementChannel: motor.dutyCycleChannel),
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

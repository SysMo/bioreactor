import 'package:bioreact/channels.dart';
import 'package:bioreact/screens/device_dashboard.dart';
import 'package:bioreact/services.dart';
import 'package:flutter/material.dart';

void main() async {
  await Services.instance.startMqtt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Services services = Services.instance;

  MyApp({super.key}) {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioReactor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bioreactor Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BioreactorChannels bioreactorChannels;
  @override
  void initState() {
    super.initState();
    bioreactorChannels =
        BioreactorChannels.mockup_mqtt(Services.instance.mqtt!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DeviceDashboard(channels: bioreactorChannels),
      ),
    );
  }
}

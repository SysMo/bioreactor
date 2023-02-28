import 'package:bioreact/screens/device_dashboard.dart';
import 'package:bioreact/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Services services = Services.instance;

  MyApp({super.key}) {
    services.startMqtt();
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DeviceDashboard(services: Services.instance),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     // const Text(
        //     //   'You have pushed the button this many times:',
        //     // ),
        //     // Text(
        //     //   '$_counter',
        //     //   style: Theme.of(context).textTheme.headlineMedium,
        //     // ),
        //   ],
        // ),
      ),
    );
  }
}

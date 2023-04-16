import 'package:bench_core/influxdb.dart';
import 'package:bioreact/model/bioreactor.dart';
import 'package:bioreact/screens/device_dashboard.dart';
import 'package:bench_dashboard/dashboards/historical_dashboard.dart';
import 'package:bioreact/services.dart';
import 'package:flutter/material.dart';

void main() async {
  await Services.instance.startMqtt();
  await Services.instance.startInfluxDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Services services = Services.instance;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  // late BioreactorDeviceConnector deviceConnector;
  late BioreactorControlConnector controlConnector =
      BioreactorControlConnector.empty();
  int screenIndex = 0;

  @override
  void initState() {
    var mqtt = Services.instance.mqtt!;
    // deviceConnector = BioreactorDeviceConnector.mockupMqtt(mqtt);

    super.initState();
    var clientBus = BioreactorBus();
    controlConnector.connectReverseChannels(clientBus);
    mqtt.connectBus(clientBus.controlSideTree());
    controlConnector.connectForwardChannels(clientBus);
  }

  @override
  Widget build(BuildContext context) {
    InfluxDBService? influxdb = Services.instance.influxdb;
    var child = screenIndex == 0
        ? DeviceDashboard(
            connector: controlConnector,
          )
        : (screenIndex == 1 && influxdb is InfluxDBService)
            ? HistoricalDashboard(influxdb: influxdb, measurements: const [
                "bioreactor/thermal/temperature/current",
                "bioreactor/stirrer/speed/current",
              ])
            : throw StateError("Illegal state");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Current",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_rounded),
            label: "Historical",
          ),
        ],
        currentIndex: screenIndex,
        onTap: (i) => setState(() {
          screenIndex = i;
        }),
      ),
    );
  }
}

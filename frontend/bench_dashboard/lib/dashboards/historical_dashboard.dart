import 'package:flutter/material.dart';
import 'package:bench_dashboard/layouts.dart';
import 'package:bench_dashboard/charts/time_series_chart.dart';
import 'package:bench_core/influxdb.dart';
import 'dart:collection';

class HistoricalDashboard extends StatefulWidget {
  final List<String> measurements;
  final InfluxDBService influxdb;
  const HistoricalDashboard(
      {super.key, required this.measurements, required this.influxdb});

  @override
  State<HistoricalDashboard> createState() => _HistoricalDashboardState();
}

class _HistoricalDashboardState extends State<HistoricalDashboard> {
  HashMap<String, TimeSeries> data = HashMap();
  String startTime = "-1h";

  void reloadData(String measurement) {
    widget.influxdb
        .getHistoric(measurement: measurement, startTime: startTime)
        .then((data) {
      setState(() {
        this.data[measurement] = data;
      });
    });
  }

  TimeSeries getData(String measurement) {
    return data[measurement] ?? TimeSeries.empty();
  }

  @override
  void initState() {
    super.initState();
    reloadAllData();
  }

  void reloadAllData() {
    for (var m in widget.measurements) {
      reloadData(m);
    }
  }

  void onTimeRangeChange(String? selectedValue) {
    setState(() {
      if (selectedValue is String) {
        startTime = selectedValue;
      }
      reloadAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[
      DropdownButton(
        items: const [
          DropdownMenuItem<String>(value: "-10m", child: Text("Last 10 mins")),
          DropdownMenuItem<String>(value: "-1h", child: Text("Last 1 hour")),
          DropdownMenuItem<String>(value: "-6h", child: Text("Last 6 hours")),
          DropdownMenuItem<String>(value: "-1d", child: Text("Last 1 day")),
          DropdownMenuItem<String>(value: "-1w", child: Text("Last 1 week")),
          DropdownMenuItem<String>(value: "-1mo", child: Text("Last 1 month")),
          DropdownMenuItem<String>(value: "0", child: Text("All data")),
        ],
        value: startTime,
        isExpanded: true,
        onChanged: onTimeRangeChange,
      ),
      ElevatedButton(
        onPressed: reloadAllData,
        child: const Icon(Icons.replay_outlined),
      )
    ];

    var children = widget.measurements
        .map((m) => TimeSeriesChart(
              data: getData(m),
            ))
        .toList();

    items.addAll(children);
    return DashboardLayout(
      children: items,
    );
  }
}

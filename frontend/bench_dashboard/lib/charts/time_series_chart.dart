import 'package:bench_core/influxdb.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TimeSeriesChart extends StatefulWidget {
  final TimeSeries data;
  const TimeSeriesChart({super.key, required this.data});

  @override
  State<TimeSeriesChart> createState() => _TimeSeriesChartState();
}

class _TimeSeriesChartState extends State<TimeSeriesChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <LineSeries<TimePoint, DateTime>>[
        LineSeries<TimePoint, DateTime>(
            // Bind data source
            dataSource: widget.data.values,
            xValueMapper: (TimePoint p, i) => p.timestamp,
            yValueMapper: (TimePoint p, _) => p.value),
      ],
      primaryXAxis: DateTimeAxis(),
      tooltipBehavior: TooltipBehavior(enable: true, animationDuration: 0),
    );
  }
}

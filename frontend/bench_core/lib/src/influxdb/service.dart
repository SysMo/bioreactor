import 'package:bench_core/src/log.dart';
import 'package:influxdb_client/api.dart';

class TimeSeries {
  List<TimePoint> values;
  TimeSeries({required this.values});
  factory TimeSeries.empty() => TimeSeries(values: []);
}

class TimePoint {
  DateTime timestamp;
  double value;
  TimePoint({required this.timestamp, required this.value});
}

class InfluxDBService with Logging {
  // final String url;
  // final String token;

  InfluxDBClient client;

  InfluxDBService._(this.client);

  factory InfluxDBService.create({
    required String url,
    required String org,
    required String token,
    required String bucket,
  }) {
    return InfluxDBService._(
        InfluxDBClient(url: url, org: org, token: token, bucket: bucket));
  }

  Future<void> start() async {}

  Future<Stream<FluxRecord>> query(String fluxQuery) async {
    var queryService = client.getQueryService();
    var recordStream = await queryService.query(fluxQuery);
    return recordStream;
  }

  Future<TimeSeries> getHistoric({
    required String measurement,
    required String startTime,
  }) async {
    var windowSize = startTime == "-10m"
        ? "1s"
        : startTime == "-1h"
            ? "10s"
            : startTime == "-6h"
                ? "1m"
                : startTime == "-1d"
                    ? "5m"
                    : startTime == "-1w"
                        ? "1h"
                        : startTime == "-1mo"
                            ? "5h"
                            : "-1d";

    //TimeSeries
    var q = '''
      from(bucket: "bio-test1")
        |> range(start: $startTime)
        |> filter(fn: (r) => r["_measurement"] == "$measurement")
        |> aggregateWindow(every: $windowSize, fn: median, createEmpty: false)
        |> yield(name: "median")
    ''';

    var rawResult = await query(q);

    var result = await rawResult.fold(TimeSeries.empty(), (acc, rec) {
      var timestamp = DateTime.parse(rec['_time']);
      var value = rec['_value'];
      acc.values.add(TimePoint(timestamp: timestamp, value: value));
      return acc;
    });

    return result;
  }
}

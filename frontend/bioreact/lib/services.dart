import 'package:bench_core/mqtt.dart';
import 'package:bench_core/influxdb.dart';

class Services {
  MqttService? mqtt;
  InfluxDBService? influxdb;

  static final Services instance = Services();

  Future<void> startMqtt() {
    var service = MqttService.create(
        url: "c0a7164f.ala.us-east-1.emqxsl.com",
        username: "sysmo",
        password: "sysmopass",
        clientId: "bio_app");
    mqtt = service;
    return service.start();
  }

  Future<void> startInfluxDB() {
    var service = InfluxDBService.create(
        url: "http://localhost:8086",
        org: "sysmo",
        token:
            "btCOTp0cn0rolkH-8VgU34V7_EliMEqVmP88UhoTiNS1pJEOX9Hmsl1BIk5wjRVxXQ6_6Agb7SXR2p75PC82CQ==",
        bucket: "bio-test1");
    influxdb = service;
    return service.start();
  }
}

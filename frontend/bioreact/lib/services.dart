import 'package:bench_core/mqtt.dart';

class Services {
  MqttService? mqtt;

  static final Services instance = Services();

  Future<void> startMqtt() {
    var service = MqttService.configure(
        url: "c0a7164f.ala.us-east-1.emqxsl.com",
        username: "sysmo",
        password: "sysmopass",
        clientId: "bio_app");
    mqtt = service;
    return service.connect();
  }
}

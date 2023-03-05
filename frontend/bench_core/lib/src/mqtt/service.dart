import 'dart:async';
import 'dart:convert';
import '../log.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService with Logging {
  final String url;
  final String username;
  final String password;
  final String clientId;

  static const JsonDecoder jsonDecoder = JsonDecoder();

  MqttServerClient client;
  mqtt.MqttConnectionState? connectionState;
  StreamSubscription? mainSubscription;
  Map<String, StreamController<String>> topicControllers = {};

  Future<void> connect() async {
    // client.port = port;
    // client.logging(on: true);
    client.keepAlivePeriod = 30;
    client.secure = true;
    // client.useWebSocket = true;
    client.onDisconnected = _onDisconnected;

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean() // Non persistent session for testing
        .withWillQos(mqtt.MqttQos.atMostOnce);

    logger.i('[MQTT client] MQTT client connecting....');
    client.connectionMessage = connMess;

    try {
      await client.connect(username, password);
    } catch (e) {
      logger.e(e);
      _disconnect();
    }

    /// Check if we are connected
    if (isConnected()) {
      logger.i('[MQTT client] connected');
      mainSubscription = client.updates?.listen(_onMessage);
    } else {
      logger.e('[MQTT client] ERROR: MQTT client connection failed - '
          'disconnecting, state is $connectionState');
      _disconnect();
    }
  }

  void _disconnect() {
    client.disconnect();
    _onDisconnected();
  }

  void _onDisconnected() {
    logger.i('[MQTT client] MQTT client disconnected');
  }

  bool isConnected() {
    return client.connectionStatus?.state == mqtt.MqttConnectionState.connected;
  }

  void _onMessage(List<mqtt.MqttReceivedMessage> event) {
    final mqtt.MqttPublishMessage recMess =
        event[0].payload as mqtt.MqttPublishMessage;
    final String message =
        mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    final String topic = event[0].topic;

    // logger.i("Received: [$topic] $message");
    StreamController? controller = topicControllers[topic];
    if (controller != null) {
      controller.add(message);
    }
  }

  void publish(String topic, String message) {
    final builder = mqtt.MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, mqtt.MqttQos.atMostOnce, builder.payload!);
  }

  Stream<String> subscribeToTopic(String topic) {
    var controller = StreamController<String>();
    topicControllers[topic] = controller;
    client.subscribe(topic, mqtt.MqttQos.atMostOnce);
    return controller.stream;
    //  if (connectionStatus!.state != MqttConnectionState.connected) {

    // print('[MQTT client] $connectionState');
    // if (connectionState == mqtt.MqttConnectionState.connected) {
    //   print('[MQTT client] Subscribing to ${topic.trim()}');
    // } else {
    //   print('mqtt.MqttConnectionState Cannot subscribe');
    // }
  }

  MqttService.configure(
      {required this.url,
      required this.username,
      required this.password,
      this.clientId = ""})
      : client = MqttServerClient.withPort(url, clientId, 8883);
}

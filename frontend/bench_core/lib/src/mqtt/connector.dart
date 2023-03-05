import 'package:bench_core/messages.dart';

import 'service.dart';
import 'dart:convert';

typedef Encode<T> = Map<String, Object?> Function(T);
typedef Decode<T> = T Function(Map<String, Object?>);

class StreamMqttConnector<T> {
  MqttService mqtt;
  String topic;
  Encode<T> encode;
  Decode<T> decode;

  StreamMqttConnector(
      {required this.mqtt,
      required this.topic,
      required this.encode,
      required this.decode});

  void sender(Stream<T> s) {
    s.listen((v) {
      var message = jsonEncode(encode(v));
      mqtt.publish(topic, message);
    });
  }

  Stream<T> receiver() {
    return mqtt
        .subscribeToTopic(topic)
        .map((event) => decode(jsonDecode(event)));
  }
}

class ValueStreamMqttConnector extends StreamMqttConnector<Value> {
  ValueStreamMqttConnector({required MqttService mqtt, required String topic})
      : super(
            mqtt: mqtt,
            topic: topic,
            encode: (v) => v.toJson(),
            decode: Value.fromJson);
}

abstract class ActionCodec<T> {
  Map<String, Object?> encode(T obj);
  T decode(Map<String, Object?> json);
}

class ActionStreamMqttConnector<T> extends StreamMqttConnector<T> {
  ActionStreamMqttConnector(
      {required MqttService mqtt,
      required String topic,
      required ActionCodec<T> codec})
      : super(
            mqtt: mqtt,
            topic: topic,
            encode: codec.encode,
            decode: codec.decode);
}

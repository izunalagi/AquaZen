import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:convert';

class MqttService {
  final _client = MqttServerClient(
    '192.168.255.129',
    'flutter_client',
  );

  final topic = 'esp32/sensor';

  Function(double ph)? onPhReceived;
  Function(double volume)? onVolumeReceived;

  Future<void> connect() async {
    _client.port = 1883;
    _client.keepAlivePeriod = 20;
    _client.onDisconnected = () => print('Disconnected');
    _client.onConnected = () => print('Connected');
    _client.onSubscribed = (t) => print('Subscribed to $t');
    _client.logging(on: false);

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .startClean();

    _client.connectionMessage = connMessage;

    try {
      await _client.connect();
    } catch (e) {
      print('Connection failed: $e');
      _client.disconnect();
      return;
    }

    _client.subscribe(topic, MqttQos.atMostOnce);

    _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final payload = MqttPublishPayload.bytesToStringAsString(
        recMess.payload.message,
      );

      try {
        final data = jsonDecode(payload);

        if (data.containsKey('ph') && onPhReceived != null) {
          final double ph = (data['ph'] as num).toDouble();
          onPhReceived!(ph);
        }

        if (data.containsKey('volume') && onVolumeReceived != null) {
          final double volume = (data['volume'] as num).toDouble();
          onVolumeReceived!(volume);
        }
      } catch (e) {
        print('Error parsing MQTT message: $e');
      }
    });
  }
}

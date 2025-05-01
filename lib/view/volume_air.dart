import 'package:flutter/material.dart';
import 'package:aquazenfix/service/mqtt_service.dart'; // pastikan ini sesuai path kamu

class VolumeAirScreen extends StatefulWidget {
  const VolumeAirScreen({super.key});

  @override
  State<VolumeAirScreen> createState() => _VolumeAirScreenState();
}

class _VolumeAirScreenState extends State<VolumeAirScreen> {
  double volumeAir = 0; // Default 0, nanti diupdate dari MQTT
  bool isControllingActive = false;

  final MqttService mqttService = MqttService(); // atau pakai singleton kalau perlu

  @override
  void initState() {
    super.initState();

    mqttService.onVolumeReceived = (double newVolume) {
      setState(() {
        volumeAir = newVolume;
      });
    };

    mqttService.connect(); // pastikan connect hanya sekali kalau pakai singleton
  }

  @override
  Widget build(BuildContext context) {
    final isNormal = volumeAir >= 150;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Volume Air',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Status Controlling : ',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: isControllingActive ? 'Aktif' : 'Nonaktif',
                        style: TextStyle(
                          color: isControllingActive ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Aktif 15 menit yang lalu',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isNormal ? Colors.greenAccent : Colors.redAccent,
                  width: 8,
                ),
              ),
              child: Center(
                child: Text(
                  '${volumeAir.toInt()} L',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: isNormal ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              'Status Volume Air : ${isNormal ? "Normal" : "Kurang"}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isNormal ? Colors.green : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

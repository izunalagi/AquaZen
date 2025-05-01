import 'package:flutter/material.dart';
import 'package:aquazenfix/service/mqtt_service.dart';

class PhAirScreen extends StatefulWidget {
  const PhAirScreen({super.key});

  @override
  State<PhAirScreen> createState() => _PhAirScreenState();
}

class _PhAirScreenState extends State<PhAirScreen> {
  double phair = 7.0;
  final mqttService = MqttService();

  @override
  void initState() {
    super.initState();
    mqttService.onPhReceived = (ph) {
      setState(() {
        phair = ph;
      });
    };
    mqttService.connect();
  }

  @override
  Widget build(BuildContext context) {
    bool isNormal = phair >= 6.5 && phair <= 8.5;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'pH Air',
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
              child: RichText(
                text: TextSpan(
                  text: 'Status Controlling : ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: isNormal ? 'Aktif' : 'Nonaktif',
                      style: TextStyle(
                        color: isNormal ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                    color: isNormal ? Colors.green : Colors.red,
                    width: 8,
                  ),
                ),
                child: Center(
                  child: Text(
                    phair.toStringAsFixed(2),
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
                'Status pH Air: ${isNormal ? "Normal" : "Tidak Normal"}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isNormal ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

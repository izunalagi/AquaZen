import 'package:flutter/material.dart';

class VolumeAirScreen extends StatefulWidget {
  const VolumeAirScreen({super.key});

  @override
  State<VolumeAirScreen> createState() => _VolumeAirScreenState();
}

class _VolumeAirScreenState extends State<VolumeAirScreen> {
  double volumeAir = 190; // Nanti diganti data dari IoT
  bool isControllingActive = false;

  @override
  Widget build(BuildContext context) {
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
                          color:
                              isControllingActive ? Colors.green : Colors.red,
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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  volumeAir += 5;
                });
              },
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.greenAccent, width: 8),
                ),
                child: Center(
                  child: Text(
                    '${volumeAir.toInt()} L',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              'Status Volume Air : ${volumeAir < 150 ? "Kurang" : "Normal"}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: volumeAir < 150 ? Colors.red : Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

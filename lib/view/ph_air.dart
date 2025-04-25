import 'package:flutter/material.dart';
import 'header_widget.dart';
import 'bottom_navbar_widget.dart';

class PhAirScreen extends StatefulWidget {
  const PhAirScreen({super.key});

  @override
  State<PhAirScreen> createState() => _PhAirScreenState();
}

class _PhAirScreenState extends State<PhAirScreen> {
  double phair = 7; // Nanti diganti data dari IoT
  bool isControllingActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBarWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),

            // Tombol Back di bawah kiri header
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                child: const Icon(Icons.arrow_back, size: 28),
              ),
            ),

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
                    phair += 5;
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
                      '${phair.toInt()} L',
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
                'Status pH Air : ${phair < 7 ? "Kurang" : "Normal"}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: phair < 7 ? Colors.red : Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

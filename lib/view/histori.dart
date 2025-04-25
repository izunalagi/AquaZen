import 'package:flutter/material.dart';
import 'header_widget.dart';
import 'bottom_navbar_widget.dart';

class HistoriScreen extends StatelessWidget {
  const HistoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataHistori = [
      {'ph': '1', 'volume': '180 L', 'tanggal': '01-04-2025'},
      {'ph': '7', 'volume': '190 L', 'tanggal': '08-04-2025'},
      {'ph': '14', 'volume': '130 L', 'tanggal': '15-04-2025'},
      {'ph': '6', 'volume': '120 L', 'tanggal': '22-04-2025'},
    ];

    Color getPHColor(String ph) {
      int phValue = int.tryParse(ph) ?? 7;
      if (phValue <= 2) return Colors.yellow;
      if (phValue >= 13) return Colors.pink;
      return Colors.green;
    }

    Color getVolumeColor(String volume) {
      int vol = int.tryParse(volume.replaceAll(' L', '')) ?? 0;
      return vol < 150 ? Colors.red : Colors.green;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBarWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),

            // Tombol Back
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, size: 28),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Histori',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Data Volume Air & pH Air Per Minggu:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            // Tabel + Export PDF
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Export PDF button kanan atas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          // TODO: Tambah fungsi export PDF
                        },
                        child: const Text(
                          'Export PDF',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Table Header
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Kadar pH',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Volume Air',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Tanggal',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Table Rows
                  ...dataHistori.map((item) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              item['ph']!,
                              style: TextStyle(color: getPHColor(item['ph']!)),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              item['volume']!,
                              style: TextStyle(
                                color: getVolumeColor(item['volume']!),
                              ),
                            ),
                          ),
                          Expanded(flex: 4, child: Text(item['tanggal']!)),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

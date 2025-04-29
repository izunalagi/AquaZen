import 'package:flutter/material.dart';

class HistoriScreen extends StatelessWidget {
  const HistoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataTabel = [
      {'ph': '1', 'volume': '180 L', 'tanggal': '01-04-2025'},
      {'ph': '7', 'volume': '190 L', 'tanggal': '08-04-2025'},
      {'ph': '14', 'volume': '130 L', 'tanggal': '15-04-2025'},
      {'ph': '6', 'volume': '120 L', 'tanggal': '22-04-2025'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Histori',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data Volume Air & pH Air Per Minggu:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Export PDF',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Center(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Kadar pH')),
                    DataColumn(label: Text('Volume Air')),
                    DataColumn(label: Text('Tanggal')),
                  ],
                  rows:
                      dataTabel.map((data) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(
                                data['ph'] ?? '',
                                style: TextStyle(
                                  color: _getPhColor(
                                    int.tryParse(data['ph'] ?? '0') ?? 0,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                data['volume'] ?? '',
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                            DataCell(
                              Text(
                                data['tanggal'] ?? '',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Color _getPhColor(int ph) {
    if (ph <= 6) {
      return Colors.orange;
    } else if (ph == 7) {
      return Colors.green;
    } else if (ph >= 8 && ph <= 13) {
      return Colors.purple;
    } else {
      return Colors.red;
    }
  }
}

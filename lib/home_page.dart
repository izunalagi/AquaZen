import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AquaZen Monitoring'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSection(
              title: "Monitoring & Controlling pH Air",
              status: "Normal",
              controlStatus: "Penampung Garam: Aktif",
            ),
            SizedBox(height: 16),
            _buildSection(
              title: "Monitoring & Controlling Volume Air",
              status: "Tinggi",
              controlStatus: "Penyedot Air: Menyala",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String status,
    required String controlStatus,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Status Sensor: $status", style: TextStyle(fontSize: 16)),
            Text(
              controlStatus,
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

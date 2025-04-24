import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF35B9C7),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.water_drop),
          label: 'Volume Air',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Histori'),
        BottomNavigationBarItem(icon: Icon(Icons.science), label: 'pH Air'),
      ],
    );
  }
}

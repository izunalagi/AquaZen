import 'package:flutter/material.dart';
import 'volume_air.dart';
import 'ph_air.dart';
import 'histori.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VolumeAirScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HistoriScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PhAirScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF35B9C7),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: [
        BottomNavigationBarItem(
          icon: Opacity(
            opacity: _selectedIndex == 0 ? 1.0 : 0.5,
            child: Image.asset(
              'assets/images/volume.png',
              width: 24,
              height: 24,
            ),
          ),
          label: 'Volume Air',
        ),
        BottomNavigationBarItem(
          icon: Opacity(
            opacity: _selectedIndex == 1 ? 1.0 : 0.5,
            child: Image.asset(
              'assets/images/histori.png',
              width: 24,
              height: 24,
            ),
          ),
          label: 'Histori',
        ),
        BottomNavigationBarItem(
          icon: Opacity(
            opacity: _selectedIndex == 2 ? 1.0 : 0.5,
            child: Image.asset('assets/images/ph.png', width: 24, height: 24),
          ),
          label: 'pH Air',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(AquaZenApp());
}

class AquaZenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaZen',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}

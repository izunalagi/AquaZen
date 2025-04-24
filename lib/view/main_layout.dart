import 'package:flutter/material.dart';
import 'header_widget.dart';
import 'bottom_navbar_widget.dart';

class MainLayout extends StatelessWidget {
  final Widget body;

  const MainLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [const HeaderWidget(), Expanded(child: body)]),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}

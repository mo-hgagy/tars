import 'package:flutter/material.dart';
import 'package:tars/core/widgets/custom_bottom_nav_bar.dart';
import 'package:tars/core/widgets/neumorphic_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF091426),
      extendBody: false,
      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

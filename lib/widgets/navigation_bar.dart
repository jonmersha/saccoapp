import 'package:flutter/material.dart';
class MenuBarItem extends StatefulWidget {
  const MenuBarItem({super.key});

  @override
  _MenuBarItemState createState() => _MenuBarItemState();
}

class _MenuBarItemState extends State<MenuBarItem> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('About Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Service Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Register Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Contact Us Page', style: TextStyle(fontSize: 24))),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _pages[_currentIndex];
  }
}

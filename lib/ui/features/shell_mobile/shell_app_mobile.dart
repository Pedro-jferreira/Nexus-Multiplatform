import 'package:Nexus/routing/app_routes.dart';
import 'package:Nexus/ui/core/layout/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ShellAppMobile extends StatefulWidget{
  final Widget content;

  const ShellAppMobile({super.key, required this.content});

  @override
  State<ShellAppMobile> createState() => _ShellAppMobileState();
}

class _ShellAppMobileState extends State<ShellAppMobile> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    Placeholder(color: Colors.white24,),
    Placeholder(color: Colors.orange,),
    Placeholder(color: Colors.yellow)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _selectedIndex, onTap: _onItemTapped,),
    );
  }
}
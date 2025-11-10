import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/layout/custom_navigation_drawer.dart';

class ShellApp extends StatefulWidget {
  final StatefulNavigationShell child;
  const ShellApp({super.key, required this.child});

  @override
  State<ShellApp> createState() => _ShellAppState();
}

class _ShellAppState extends State<ShellApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          CustomNavigationDrawer(),
          Expanded(child: widget.child)
        ],
      ),
    );
  }
}

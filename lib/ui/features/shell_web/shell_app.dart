import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_multiplatform/ui/core/layout/custom_app_bar.dart';

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
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            CustomNavigationDrawer(
              onItemSelected: widget.child.goBranch,
              currentIndex: widget.child.currentIndex,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Nexus/ui/core/layout/custom_app_bar.dart';

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

                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,

                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },

                  child: KeyedSubtree(
                    key: ValueKey(widget.child.currentIndex),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

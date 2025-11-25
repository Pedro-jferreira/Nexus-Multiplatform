import 'package:Nexus/ui/core/layout/custom_bottom_navigation_bar.dart';
import 'package:Nexus/ui/core/widgets/shell_mobile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellAppMobile extends StatefulWidget {
  final StatefulNavigationShell child;

  const ShellAppMobile({super.key, required this.child});

  @override
  State<ShellAppMobile> createState() => _ShellAppMobileState();
}

class _ShellAppMobileState extends State<ShellAppMobile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShellMobileAppBar(),
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: widget.child.currentIndex,
        onTap: widget.child.goBranch,
      ),
    );
  }
}

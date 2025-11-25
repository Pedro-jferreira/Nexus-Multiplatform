import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Nexus/ui/core/layout/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../../core/layout/custom_navigation_drawer.dart';

class ShellApp extends StatefulWidget {
  final StatefulNavigationShell child;
  const ShellApp({super.key, required this.child,});

  @override
  State<ShellApp> createState() => _ShellAppState();
}

class _ShellAppState extends State<ShellApp> {
  late final AuthRepository _repository;

  @override
  void initState() {
    _repository = context.read<AuthRepository>();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _repository,
      builder: (context,_) {
        final user = _repository.currentUser;
        return Scaffold(
          body: Center(
            child: Row(
              children: [
                CustomNavigationDrawer(
                  profileUrl: user?.profileImageUrl,
                  onLogout: _repository.logout,
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
    );
  }
}

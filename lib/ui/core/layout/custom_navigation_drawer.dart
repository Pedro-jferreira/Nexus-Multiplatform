import 'package:flutter/material.dart';
import 'package:nexus_multiplatform/data/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 300,
      height: double.infinity,
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            final repository = context.read<AuthRepository>();
            await repository.logout();
          },
          child: Text('logout'),
        ),
      ),
    );
  }
}

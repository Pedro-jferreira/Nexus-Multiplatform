import 'package:Nexus/ui/core/widgets/custom_circle_avatar.dart';
import 'package:Nexus/ui/features/profile/user.dart';
import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final User user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            Center(
              child: Column(
                children: [
                  CustomCircleAvatar(iconData: Icons.person, width: 161, height: 161),
                  Text(user.name),
                  Text(user.email),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

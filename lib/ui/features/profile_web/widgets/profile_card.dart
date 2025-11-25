import 'package:Nexus/ui/core/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? profileImg;
  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    this.profileImg,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 32),
        constraints: BoxConstraints(maxWidth: 397),
        width: double.infinity,
        child: Column(
          spacing: 27,
          children: [
            CustomCircleAvatar(
              iconData: Icons.person,
              imageUrl: profileImg,
              width: 160,
              height: 160,
            ),
            Text(
              name,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(email, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

import 'package:Nexus/ui/core/widgets/custom_circle_avatar.dart';
import 'package:Nexus/ui/features/profile/user.dart';
import 'package:flutter/material.dart';

typedef UserData = Map<String, dynamic>;

class UserProfileCard extends StatelessWidget {
  final UserData? userData;

  const UserProfileCard({Key? key, this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Center(child: Text('Nenhum dado de perfil disponível.'));
    }
    final String name = userData!['name'];
    final String email = userData!['email'];
    final String avatarUrl =
        userData!['avatarUrl'];
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
                  CustomCircleAvatar(
                    imageUrl: avatarUrl,
                    iconData: Icons.person,
                    width: 161,
                    height: 161,
                  ),
                  Text(name),
                  Text(email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

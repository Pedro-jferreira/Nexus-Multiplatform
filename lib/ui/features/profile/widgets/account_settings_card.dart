import 'package:flutter/material.dart';

class AccountSettingsCard extends StatelessWidget{
  const AccountSettingsCard({super.key});

  Widget _buildSettingOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0,top: 15.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configurações da conta',
            ),
            _buildSettingOption(
              icon: Icons.lock_outline,
              text: 'Redefinir senha',
              onTap: () {
              },
            ),
            _buildSettingOption(
              icon: Icons.email,
              text: 'Gerenciar Login com Google',
              onTap: () {
              },
            ),
          ]
        )
      )
    );
  }
}
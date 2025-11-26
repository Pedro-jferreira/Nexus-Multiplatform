import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettings extends StatelessWidget {
  final  void Function()? onResetPassword;
  final  void Function()? onGoogleManagement;
  const AccountSettings({super.key, this.onResetPassword, this.onGoogleManagement});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final buttonTextStyle = textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
      decoration: TextDecoration.underline, // Adiciona a linha embaixo
      decorationColor: colorScheme.onSurface, // Garante que a linha tenha a mesma cor do texto
    );
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 22),
        constraints: BoxConstraints(maxWidth: 397),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações da Conta:',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17.0, bottom: 7),
              child: TextButton.icon(
                onPressed: onResetPassword,
                label: Text('Redefinir senha', style: buttonTextStyle,),
                icon: Icon(
                  Icons.lock_outline_rounded,
                  color: colorScheme.primaryContainer,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: onGoogleManagement,
              label: Text('Gerenciar Login com Google',style: buttonTextStyle,),
              icon: SvgPicture.asset(
                'assets/icons/google.svg',
                width: 20,
                height: 20,
              ),

            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nexus_multiplatform/routing/app_router.dart';

class ButtonsLogin extends StatelessWidget {
  final void Function()? googleLoginOnPressed;
  final void Function()? loginOnPressed;

  const ButtonsLogin({
    super.key,
    required this.googleLoginOnPressed,
    required this.loginOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 27.0,),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 291),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 27,
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed:loginOnPressed ,
                style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),

                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                  foregroundColor: Theme.of(context).colorScheme.onTertiary,
                  textStyle: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                child: Text('Entrar'),

              ),
            ),
            TextButton(
              onPressed: ()=> ForgotPasswordRouter().push(context),
              child: Text(
                'Esqueci minha senha',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.onPrimary,
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: googleLoginOnPressed,
                icon: SizedBox(
                  width: 22,
                  height: 22,
                  child: Image.asset('assets/icons/google.png'),
                ),
                label: Text('Entrar com o Google'),
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10)
                ) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

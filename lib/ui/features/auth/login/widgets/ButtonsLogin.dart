import 'package:flutter/material.dart';
import 'package:Nexus/routing/app_router.dart';
import 'package:Nexus/ui/core/theme/theme_mobile.dart';

import '../../../../../routing/routes/web/app_router_web.dart';
import '../../../../../utils/responsive_utils.dart';

class ButtonsLogin extends StatelessWidget {
  final void Function()? googleLoginOnPressed;
  final void Function()? loginOnPressed;
  final bool isLoading;

  const ButtonsLogin({
    super.key,
    required this.googleLoginOnPressed,
    required this.loginOnPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final device = Responsive.getDeviceType(context);
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 30,),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 291),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: isLoading? null: loginOnPressed ,
                    style: FilledButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10),

                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: Theme.of(context).colorScheme.onSecondary,
                      textStyle: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    child:isLoading?CircularProgressIndicator(): Text('Entrar'),

                  ),
                ),
                TextButton(
                  onPressed: ()=> ForgotPasswordRouter().push(context),
                  child: Text(
                    'Esqueci minha senha',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:(device == DeviceScreenType.mobile)? context.colors.text: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor:(device == DeviceScreenType.mobile)?  context.colors.text: Theme.of(context).colorScheme.onSurface,
                      decorationThickness: 3,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
                if(device == DeviceScreenType.mobile)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: googleLoginOnPressed,
                    icon: SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.asset('assets/icons/google.png'),
                    ),
                    label: Text('Entrar com o Google'),
                    style:ElevatedButton.styleFrom(
                      backgroundColor: context.colors.surface,
                      foregroundColor: context.colors.text,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          50,
                        ), // controla o arredondamento
                        side: BorderSide(
                          color: context.colors.primaryEmphasis,
                        ), // define a cor da borda
                      ),
                    ) ,
                  ),
                )else
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
                          padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        foregroundColor: Theme.of(context).colorScheme.onSurface
                      ) ,
                    ),
                  )
              ],
            ),
          ),
        ),
        SizedBox(width: 30,),

      ],
    );
  }
}

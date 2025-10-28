import 'package:flutter/material.dart';

import '../../../../../domain/validators/auth_validators.dart';
import '../../../../../utils/responsive_ultils.dart';
import '../../../../core/theme/theme_mobile.dart';

class RequestForgot extends StatefulWidget {
  const RequestForgot({super.key});

  @override
  State<RequestForgot> createState() => _RequestForgotState();
}

class _RequestForgotState extends State<RequestForgot> {
  final validator = EmailRequestValidation();
  final emailController = TextEditingController();
  EmailRequestDto requestDto = EmailRequestDto.empty();

  @override
  Widget build(BuildContext context) {
    final device = Responsive.getDeviceType(context);

    return device == DeviceScreenType.mobile? _buildMobile(context): _buildWeb(context);
  }

  Padding _buildMobile(BuildContext context) {

    return Padding(
    padding: const EdgeInsets.only(right: 16.0,left: 16, bottom: 50),
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 291),
      child: Column(
        spacing: 43,
        children: [
          Text(
            'Por favor, informe seu e-mail cadastrado para que possamos enviar um link de recuperação.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: text,
              fontWeight: FontWeight.w600
            ),
          ),
          Column(
            spacing: 18,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                controller: emailController,
                validator: validator.byField(requestDto, 'email'),
                onChanged: requestDto.setEmail,
                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: primaryEmphasis, // cor da borda padrão
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: primaryMain, // cor quando estiver em foco
                      width: 2, // deixa mais espesso ao focar
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: error, // cor da borda no erro
                      width: 1.5,
                    ),
                  ),
                  errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: error),
                  // borda quando há erro e o campo está em foco
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: error, // cor mais forte com foco
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                  prefixIconColor: WidgetStateColor.resolveWith((states) {
                    if (states.contains(WidgetState.error)) return error;
                    if (states.contains(WidgetState.focused)) return primaryMain;
                    return primaryEmphasis;
                  }),
                  hintText: 'E-mail Cadastrado',
                  filled: true,
                  fillColor: surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),

                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: secondaryMain,
                      foregroundColor: surface
                  ) ,
                  child :const Text('Enviar link de recuperação'),
                ),
              ),
            ],
          ),

        ],
      ),
    ),
  );
  }
Padding _buildWeb(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(right: 16.0,left: 16, bottom: 50, top: 5),
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 291),
      child: Column(
        spacing: 30,
        children: [
          Text(
            'Por favor, informe seu e-mail cadastrado para que possamos enviar um link de recuperação.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 21),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                hintText: 'E-mail Cadastrado',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style:ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary
              ) ,
              child: Text('Enviar link de recuperação'),
            ),
          ),
        ],
      ),
    ),
  );
  }}

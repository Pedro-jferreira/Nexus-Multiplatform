import 'package:flutter/material.dart';

class RequestForgot extends StatelessWidget {
  const RequestForgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0,left: 16, bottom: 50),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 291),
        child: Column(
          spacing: 30,
          children: [
            Text(
              'Por favor, informe seu e-mail cadastrado para que possamos enviar um link de recuperação.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600
              ),
            ),
            TextFormField(
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Enviar link de recuperação'),
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

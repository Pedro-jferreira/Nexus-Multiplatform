import 'package:Nexus/domain/validators/auth_validators.dart';
import 'package:Nexus/ui/features/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/models/requests/gen_models.dart';

class LockedPage extends StatefulWidget {
  final LoginViewModel viewModel;
  final void Function()? onPressed;
  const LockedPage({super.key, this.onPressed, required this.viewModel});

  @override
  State<LockedPage> createState() => _LockedPageState();
}

class _LockedPageState extends State<LockedPage> {
  final _formKey = GlobalKey<FormState>();
  final UnlockAccountDto model = UnlockAccountDto.empty();
  final UnlockAccountValidator validator = UnlockAccountValidator();

  @override
  void initState() {
    super.initState();
    // Registra o ouvinte para sucesso/erro
    widget.viewModel.requestUnlockCmd.addListener(_onCommandChanged);
  }

  @override
  void dispose() {
    // Remove o ouvinte para evitar memory leaks e erros
    widget.viewModel.requestUnlockCmd.removeListener(_onCommandChanged);
    super.dispose();
  }

  void _onCommandChanged() {
    final cmd = widget.viewModel.requestUnlockCmd;
    final value = cmd.value;

    if (value is FailureCommand<Unit>) {
      final error = value.error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      cmd.reset();
    } else if (value.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Solicitação enviada com sucesso! Verifique seu e-mail.',
          ),
          backgroundColor: Colors.green,
        ),
      );
      _formKey.currentState?.reset();
      model.setEmail('');
      cmd.reset();
    }
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    final isFormValid = _formKey.currentState?.validate() ?? false;
    final isModelValid = validator.validate(model).isValid;

    if (isFormValid && isModelValid) {
      final request = UnlockAccountRequest.fromDto(model);
      widget.viewModel.requestUnlockCmd.execute(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Image.asset(
                        'assets/logos/logo_vetorizada_colorida.png',
                        height: 55,
                      ),
                      Text('NEXUS'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23.0, bottom: 50),
                    child: Image.asset(
                      'assets/images/forgot-password.png',
                      height: 250,
                    ),
                  ),
                  Text(
                    'Limite de Tentativas Atingido!',
                    style: textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 668),
                      child: Text(
                        'Você excedeu o número máximo de tentativas de login.Por motivos de segurança, seu acesso foi temporariamente bloqueado.Para continuar, solicite o desbloqueio ao administrador do sistema.',
                        style: textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ListenableBuilder(
                    listenable: widget.viewModel.requestUnlockCmd,
                    builder: (context, _) {
                      final isRunning =
                          widget.viewModel.requestUnlockCmd.value.isRunning;
                      return ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            spacing: 15,
                            children: [
                              TextFormField(
                                onChanged: model.setEmail,
                                // Conecta o validador do Lucid
                                validator: validator.byField(model, 'email'),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Digite seu e-mail',
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),

                              SizedBox(
                                width: double.infinity,
                                child: FilledButton.tonal(
                                  onPressed: isRunning ? null : _onSubmit,
                                  child: isRunning
                                      ? SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(),
                                        )
                                      : const Text('Solicitar desbloqueio'),
                                ),
                              ),

                              SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                  onPressed: widget.onPressed,
                                  child: const Text('Voltar'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

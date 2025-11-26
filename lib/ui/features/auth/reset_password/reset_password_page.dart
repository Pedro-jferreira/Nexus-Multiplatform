import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/ui/features/auth/reset_password/view_models/reset_password_view_model.dart';
import 'package:Nexus/ui/features/auth/reset_password/widgets/form_reset_password.dart';
import 'package:Nexus/ui/features/auth/reset_password/widgets/temporary_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/validators/auth_validators.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final ResetPasswordViewModel _viewModel;
  final UpdatePasswordDto _model = UpdatePasswordDto.empty();
  final UpdatePasswordValidator _validator = UpdatePasswordValidator();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _viewModel = ResetPasswordViewModel(repository: context.read());
    _viewModel.updateCmd.addListener(_updateHandler);
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.updateCmd.removeListener(_updateHandler);
    _viewModel.dispose();
    super.dispose(); //
  }

  void _updateHandler() {
    final cmd = _viewModel.updateCmd;
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
    } else if (value is SuccessCommand<Unit>) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Senha redefinida com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      _formKey.currentState?.reset();
      _model.clean();
      cmd.reset();
    }
  }

  bool _validateForm() {
    final formValid = _formKey.currentState?.validate() ?? false;
    final contentValid = _validator.validate(_model).isValid;
    return formValid && contentValid;
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    if (_validateForm()) {
      final request = UpdatePasswordRequest.fromDto(_model);
      _viewModel.updateCmd.execute(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  ListenableBuilder(
        listenable: Listenable.merge([_viewModel, _viewModel.updateCmd]),
        builder: (context, asyncSnapshot) {
          final isRunning = _viewModel.updateCmd.value.isRunning;
          final isTemporary = _viewModel.isTemporaryPassword;
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: !isTemporary,
                ),
                body:  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 300),
                        width: double.infinity,
                        child: Column(
                          spacing: 20,
                          children: [
                            Text('Redefinir senha', style: textTheme.headlineMedium),
                            FormResetPassword(
                              disable: isRunning,
                              formKey: _formKey,
                              model: _model,
                              validator: _validator,
                              onFormSubmitted: isRunning ? () {} : _onSubmit,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.tonal(
                                onPressed: isRunning ? null : _onSubmit,
                                child: isRunning
                                    ? CircularProgressIndicator()
                                    : Text('Redefinir'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isTemporary)
                TemporaryAlert(),
            ],
          );
        },
      );
  }
}

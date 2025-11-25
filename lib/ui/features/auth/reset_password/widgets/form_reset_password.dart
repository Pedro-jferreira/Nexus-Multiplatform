import 'package:Nexus/ui/features/auth/reset_password/widgets/password_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/validators/auth_validators.dart';

class FormResetPassword extends StatefulWidget {
  const FormResetPassword({
    super.key,
    required this.onFormSubmitted,
    required this.model,
    required this.validator,
    required this.formKey,
    this.disable = false
  });
  final VoidCallback onFormSubmitted;
  final UpdatePasswordDto model;
  final UpdatePasswordValidator validator;
  final GlobalKey<FormState> formKey;
  final bool disable;

  @override
  State<FormResetPassword> createState() => _FormResetPasswordState();
}

class _FormResetPasswordState extends State<FormResetPassword> {
  bool _showPassword = false;
  bool _showNewPassword = false;
  bool _showConfNewPassword = false;
  late FocusNode _passwordFocus;
  late FocusNode _newPasswordFocus;
  late FocusNode _confirmPasswordFocus;

  @override
  void initState() {
    super.initState();
    _passwordFocus = FocusNode();
    _newPasswordFocus = FocusNode();
    _confirmPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    _passwordFocus.dispose();
    _newPasswordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: AutofillGroup(
        child: Column(
          spacing: 20,
          children: [
            PasswordFormField(
              enable: !widget.disable,
              label: 'Senha atual',
              hint: 'Digite sua senha atual',
              showPassword: _showPassword,
              onToggleVisibility: () =>
                  setState(() => _showPassword = !_showPassword),
              onChanged: widget.model.setCurrentPassword,
              validator: widget.validator.byField(
                widget.model,
                'current_password',
              ),
              autofillHints: const [AutofillHints.password],
              focusNode: _passwordFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_newPasswordFocus),
            ),

            PasswordFormField(
              enable: !widget.disable,
              label: 'Nova senha',
              hint: 'Digite sua nova senha',
              showPassword: _showNewPassword,
              onToggleVisibility: () =>
                  setState(() => _showNewPassword = !_showNewPassword),
              onChanged: widget.model.setNewPassword,
              validator: widget.validator.byField(widget.model, 'new_password'),
              autofillHints: const [AutofillHints.newPassword],
              focusNode: _newPasswordFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_confirmPasswordFocus),
            ),

            PasswordFormField(
              enable: !widget.disable,
              label: 'Confirmar nova senha',
              hint: 'Confirme sua nova senha',
              showPassword: _showConfNewPassword,
              onToggleVisibility: () =>
                  setState(() => _showConfNewPassword = !_showConfNewPassword),
              onChanged: widget.model.setConfirmNewPassword,
              validator: widget.validator.byField(
                widget.model,
                'confirm_password',
              ),
              autofillHints: const [AutofillHints.newPassword],
              focusNode: _confirmPasswordFocus,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                _confirmPasswordFocus.unfocus();
                widget.onFormSubmitted();
              },
            ),
          ],
        ),
      ),
    );
  }
}

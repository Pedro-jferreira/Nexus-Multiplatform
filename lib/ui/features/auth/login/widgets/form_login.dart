import 'package:flutter/material.dart';

import '../../../../../domain/validators/auth_validators.dart';

class FormLogin extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormLogin({super.key, required this.formKey});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final validator = LoginParamValidation();
  final loginParamDto = LoginParamDto.empty();
  bool _showPassword = false;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  void _handlerVisibility() {
    setState(() => _showPassword = !_showPassword);
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 23,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 291),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: loginParamDto.setEmail,
              validator: validator.byField(loginParamDto, 'email'),
              controller: _emailController,
              textInputAction: TextInputAction.next,
              focusNode: _emailFocus,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                hintText: 'Email',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 291),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: loginParamDto.setPassword,
              validator: validator.byField(loginParamDto, 'password'),
              controller: _passwordController,
              obscureText: !_showPassword,
              textInputAction: TextInputAction.done,
              focusNode: _passwordFocus,
              onFieldSubmitted: (_) {
                _passwordFocus.unfocus(); // fecha o teclado
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.keyboard_alt_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                hintText: 'Senha',
                filled: true,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                suffixIcon: IconButton(
                  iconSize: 24,
                  onPressed: _handlerVisibility,
                  icon: _showPassword
                      ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.visibility_outlined),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

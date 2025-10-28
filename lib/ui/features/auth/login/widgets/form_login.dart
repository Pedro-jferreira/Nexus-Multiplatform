import 'package:flutter/material.dart';
import 'package:nexus_multiplatform/ui/core/theme/theme.dart';
import 'package:nexus_multiplatform/ui/core/theme/theme_mobile.dart';

import '../../../../../domain/validators/auth_validators.dart';
import '../../../../../utils/responsive_ultils.dart';

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
    final device = Responsive.getDeviceType(context);

    return device == DeviceScreenType.mobile
        ? _buildFormMobile(context)
        : _buildForm(context);
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 23,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30),
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
                    ),
                    prefixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.error)) {
                        return Theme.of(context).colorScheme.error;
                      }
                      return Theme.of(context).colorScheme.primary;
                    }),
                    hintText: 'Email',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30),
            ],
          ),
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 30),
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
                    prefixIcon: Icon(Icons.keyboard_alt_outlined),
                    prefixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.error)) {
                        return Theme.of(context).colorScheme.error;
                      }
                      return Theme.of(context).colorScheme.primary;
                    }),
                    hintText: 'Senha',

                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: IconButton(
                      style: IconButton.styleFrom(
                        alignment: AlignmentGeometry.center,
                        padding: EdgeInsets.zero,
                        elevation: 10,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: _handlerVisibility,
                      icon: _showPassword
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Form _buildFormMobile(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 23,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(width: 30),
              Flexible(
                child: ConstrainedBox(
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
                      errorStyle: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: error),
                      // borda quando há erro e o campo está em foco
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: error, // cor mais forte com foco
                          width: 2,
                        ),
                      ),

                      prefixIcon: Icon(Icons.email_outlined),
                      prefixIconColor: WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.error)) return error;
                        if (states.contains(WidgetState.focused))
                          return primaryMain;
                        return primaryEmphasis;
                      }),
                      hintText: 'Email',
                      filled: true,
                      fillColor: surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: primaryEmphasis, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30),
            ],
          ),
          Row(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(width: 30),
              Flexible(
                child: ConstrainedBox(
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
                      errorStyle: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: error),
                      // borda quando há erro e o campo está em foco
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: error, // cor mais forte com foco
                          width: 2,
                        ),
                      ),

                      prefixIcon: Icon(Icons.keyboard_alt_outlined),
                      prefixIconColor: WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.error)) return error;
                        if (states.contains(WidgetState.focused))
                          return primaryMain;
                        return primaryEmphasis;
                      }),
                      hintText: 'Senha',
                      filled: true,
                      fillColor: surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: primaryEmphasis, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: surface,
                        foregroundColor: primaryEmphasis,
                        alignment: AlignmentGeometry.center,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            50,
                          ), // controla o arredondamento
                          side: BorderSide(
                            color: primaryEmphasis,
                          ), // define a cor da borda
                        ),
                      ),
                      onPressed: _handlerVisibility,
                      icon: _showPassword
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nexus_multiplatform/ui/core/theme/theme_mobile.dart';

import '../../../../../domain/validators/auth_validators.dart';
import '../../../../../utils/responsive_utils.dart';

class FormLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginParamDto loginParamDto;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;
  final bool showPassword;
  final bool? disabled;
  final VoidCallback onTogglePassword;
  final VoidCallback onSubmit;
  final LoginParamValidation validator;

  const FormLogin({
    super.key,
    required this.formKey,
    required this.loginParamDto,
    required this.emailController,
    required this.passwordController,
    required this.emailFocus,
    required this.passwordFocus,
    required this.showPassword,
    required this.onTogglePassword,
    required this.onSubmit,
    required this.validator,
    this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    final device = Responsive.getDeviceType(context);

    return device == DeviceScreenType.mobile
        ? _buildFormMobile(context)
        : _buildForm(context);
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: formKey,
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
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [
                      AutofillHints.username,
                      AutofillHints.email,
                    ],
                    enabled: (disabled != true),
                    focusNode: emailFocus,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
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
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 291),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: loginParamDto.setPassword,
                    validator: validator.byField(loginParamDto, 'password'),
                    controller: passwordController,
                    obscureText: !showPassword,
                    textInputAction: TextInputAction.done,
                    focusNode: passwordFocus,
                    enabled: (disabled != true),
                    autofillHints: const [AutofillHints.password],
                    onFieldSubmitted: (_) {
                      passwordFocus.unfocus();
                      onSubmit();
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
                      onPressed: (disabled != true) ? onTogglePassword : null,
                      icon: showPassword
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
      key: formKey,
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
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    focusNode: emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [
                      AutofillHints.username,
                      AutofillHints.email,
                    ],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    enabled: (disabled != true),

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
                        if (states.contains(WidgetState.focused)) {
                          return primaryMain;
                        }
                        return primaryEmphasis;
                      }),
                      hintText: 'Email',
                      filled: true,
                      fillColor: surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: primaryEmphasis,
                          width: 1,
                        ),
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
                    controller: passwordController,
                    obscureText: !showPassword,
                    textInputAction: TextInputAction.done,
                    focusNode: passwordFocus,
                    autofillHints: const [AutofillHints.password],
                    enabled: (disabled != true),

                    onFieldSubmitted: (_) {
                      passwordFocus.unfocus();
                      onSubmit();
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: primaryEmphasis,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: primaryMain, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: error, width: 1.5),
                      ),
                      errorStyle: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: error),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: error, width: 2),
                      ),

                      prefixIcon: Icon(Icons.keyboard_alt_outlined),
                      prefixIconColor: WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.error)) return error;
                        if (states.contains(WidgetState.focused)) {
                          return primaryMain;
                        }
                        return primaryEmphasis;
                      }),
                      hintText: 'Senha',
                      filled: true,
                      fillColor: surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: primaryEmphasis,
                          width: 1,
                        ),
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
                      onPressed: (disabled != true) ? onTogglePassword : null,
                      icon: showPassword
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

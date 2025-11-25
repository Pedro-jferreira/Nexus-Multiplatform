import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool showPassword;
  final VoidCallback onToggleVisibility;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final bool? enable;

  const PasswordFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.showPassword,
    required this.onToggleVisibility,
    required this.focusNode,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.autofillHints,
    this.enable
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      enabled: enable,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: validator,
      autofillHints: autofillHints,
      obscureText: !showPassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.keyboard_alt_outlined),
        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return colorScheme.error;
          }
          return colorScheme.primary;
        }),
        suffixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return colorScheme.error;
          }
          return colorScheme.primary;
        }),
        labelText: label,
        hintText: hint,
        suffixIcon: IconButton(
          onPressed: onToggleVisibility,
          icon: Icon(
            showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final ButtonStyleButton? primaryActionButton;
  final ButtonStyleButton? secondaryActionButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.primaryActionButton,
    this.secondaryActionButton,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      actions: [
        if (secondaryActionButton != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _wrapWithDefaultStyle(
              context,
              secondaryActionButton!,
              backgroundColor: colorScheme.secondary,
              foregroundColor: colorScheme.onSecondary,
            ),
          ),
        if(primaryActionButton != null && secondaryActionButton != null) SizedBox(width: 15,),
        if (primaryActionButton != null)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _wrapWithDefaultStyle(
              context,
              primaryActionButton!,
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
          ),
      ],
    );
  }

  /// 🔹 Aplica o estilo padrão se o botão não tiver um definido
  Widget _wrapWithDefaultStyle(
      BuildContext context,
      ButtonStyleButton button, {
        required Color backgroundColor,
        required Color foregroundColor,
      }) {
    final ButtonStyle defaultStyle = FilledButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );

    return Theme(
      data: Theme.of(context).copyWith(
        filledButtonTheme: FilledButtonThemeData(style: defaultStyle),
      ),
      child: button,
    );
  }
}
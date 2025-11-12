import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final String title;
  final Widget child;
  final ButtonStyleButton? primaryActionButton;
  final ButtonStyleButton? secondaryActionButton;
  final ButtonStyleButton? helperActionButton;
  final bool showClose;
  final Future<void> Function()? onClose;
  const CustomModal({
    super.key,
    required this.title,
    required this.child,
    this.primaryActionButton,
    this.secondaryActionButton,
    this.helperActionButton,
    this.showClose = true, this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: IntrinsicWidth(
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (showClose)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await onClose?.call();
                      },
                      tooltip: 'Fechar',
                    ),
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              child,

              Row(
                mainAxisAlignment:(helperActionButton != null)? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
                children: [
                  if (helperActionButton != null)
                    _wrapWithDefaultStyle(
                      context,
                      helperActionButton!,
                      backgroundColor: colorScheme.primaryContainer,
                      foregroundColor: colorScheme.onPrimaryContainer,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (secondaryActionButton != null)
                        _wrapWithDefaultStyle(
                          context,
                          secondaryActionButton!,
                          backgroundColor: colorScheme.surfaceContainerHighest,
                          foregroundColor: colorScheme.onSurface,
                        ),
                      if (primaryActionButton != null &&
                          secondaryActionButton != null)
                        SizedBox(width: 15),
                      if (primaryActionButton != null)
                        _wrapWithDefaultStyle(
                          context,
                          primaryActionButton!,
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
      textStyle: Theme.of(context).textTheme.labelLarge,
    );

    return Theme(
      data: Theme.of(
        context,
      ).copyWith(filledButtonTheme: FilledButtonThemeData(style: defaultStyle)),
      child: button,
    );
  }
}

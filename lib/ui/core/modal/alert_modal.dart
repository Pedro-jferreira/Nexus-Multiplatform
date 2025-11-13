import 'package:flutter/material.dart';

class AlertModal extends StatelessWidget {
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const AlertModal({
    super.key,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: theme.colorScheme.surfaceVariant,
      contentPadding: EdgeInsets.symmetric(horizontal: 117.0, vertical: 23.0),
      actionsPadding: EdgeInsets.only(right: 117.0, bottom: 23.0, left: 117.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.0,
        children: <Widget>[
          Image.asset(
            'assets/icons/alert-icon.png',
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(18.0),
            backgroundColor: theme.colorScheme.primaryContainer,
          ),
          onPressed: () {
            onConfirm();
          },
          child: Text(
            "Sim, tenho certeza!",
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        SizedBox(width: 20.0),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(18.0),
            backgroundColor: theme.colorScheme.secondaryContainer,
          ),
          onPressed: () {
            onCancel();
          },
          child: Text(
            "Cancelar",
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
import 'package:flutter/material.dart';

class SuccessModal extends StatelessWidget {
  final String message;

  const SuccessModal({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: theme.colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 150.0),
        child: Column(
          spacing: 23.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/check_circle.png',
              width: 120,
              height: 120,
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
      ),
    );
  }
}

void showSuccessModal(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return SuccessModal(message: message);
    },
  );

  Future.delayed(const Duration(seconds: 3), () {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  });
}
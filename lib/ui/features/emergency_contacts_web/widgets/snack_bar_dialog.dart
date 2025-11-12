import 'package:flutter/material.dart';

class SnackBarDialog extends StatelessWidget {
  final String? error;
  const SnackBarDialog({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) {
        final offsetAnimation =
        Tween<Offset>(
          begin: const Offset(0, -0.4), // vem de cima
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeInBack,
          ),
        );

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: (error != null)
          ? Container(
        key: const ValueKey('error_box'),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Text(
          error ?? 'Erro desconhecido',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
      )
          : const SizedBox(key: ValueKey('empty_box')),
    );
  }
}

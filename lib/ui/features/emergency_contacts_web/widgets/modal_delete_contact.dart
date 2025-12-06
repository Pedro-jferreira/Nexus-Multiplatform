import 'package:flutter/material.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/view_models/emergency_contact_view_model.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/widgets/snack_bar_dialog.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';
import 'contact_editor_modal.dart';

class ModalDeleteContact extends StatefulWidget {
  final int id;
  final EmergencyContactViewModel viewModel;
  const ModalDeleteContact({
    super.key,
    required this.id,
    required this.viewModel,
  });

  @override
  State<ModalDeleteContact> createState() => _ModalDeleteContactState();
}

class _ModalDeleteContactState extends State<ModalDeleteContact> {
  String? error;

  @override
  void initState() {
    widget.viewModel.deleteCmd.addListener(_handleDelete);
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.deleteCmd.removeListener(_handleDelete);
    super.dispose();
  }

  void _handleDelete() {
    final cmd = widget.viewModel.deleteCmd;
    final value = widget.viewModel.deleteCmd.value;

    switch (value) {
      case IdleCommand<Unit>():
      case CancelledCommand<Unit>():
      case RunningCommand<Unit>():
        return;
      case FailureCommand<Unit>():
        if (error == null) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) setState(() => error = value.error.toString());
          });
        }
        Future.delayed(const Duration(seconds: 5), () {
          error = null;
          cmd.reset();
        });
        break;
      case SuccessCommand<Unit>():
        Navigator.of(context).pop();
        Future.microtask(() {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => SuccessModal(
              title: 'Contato apagado com sucesso!',
              message: 'O contato foi apagado na sua lista de emergência.',
              onClose: () {
                cmd.reset();
              },
            ),
          );
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: widget.viewModel.deleteCmd,
      builder: (context, _) {
        final isLoading = widget.viewModel.deleteCmd.value.isRunning;
        final value = widget.viewModel.deleteCmd.value;

        if (value.isSuccess) {
          return SizedBox.shrink();
        }

        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 23, horizontal: 117),
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isLoading)
                    SizedBox(width:100, height:100,child: Center(child: CircularProgressIndicator()))
                  else
                    Stack(
                      children: [
                        Column(
                          spacing: 10,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 80,
                              color: colorScheme.error,
                            ),
                            Text(
                              'Deseja deletar esse Contato?',
                              style: textTheme.titleLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                spacing: 15,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FilledButton(
                                    onPressed: () => widget.viewModel.deleteCmd
                                        .execute(widget.id),
                                    child: Text('Sim, tenho certeza!'),
                                  ),
                                  FilledButton.tonal(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Cancelar'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 400),
                            child: SnackBarDialog(error: error)),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

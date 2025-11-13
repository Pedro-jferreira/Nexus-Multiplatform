
import 'package:flutter/material.dart';
import 'package:nexus_multiplatform/domain/models/requests/gen_models.dart';
import 'package:nexus_multiplatform/domain/models/responses/gen_models.dart';
import 'package:nexus_multiplatform/domain/validators/emergency_validator.dart';
import 'package:nexus_multiplatform/ui/core/modal/custom_modal.dart';
import 'package:nexus_multiplatform/ui/features/emergency_contacts_web/view_models/emergency_contact_view_model.dart';
import 'package:nexus_multiplatform/ui/features/emergency_contacts_web/widgets/snack_bar_dialog.dart';
import 'package:result_command/result_command.dart';

import '../../../core/widgets/image_uploader.dart';
import 'emergency_contact_form.dart';

class ModalCratedContact extends StatefulWidget {
  final EmergencyContactViewModel viewModel;

  const ModalCratedContact({super.key, required this.viewModel});

  @override
  State<ModalCratedContact> createState() => _ModalCratedContactState();
}

class _ModalCratedContactState extends State<ModalCratedContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _imageController = ImageUploadController();
  final ContactValidador _validador = ContactValidador();
  final _formKey = GlobalKey<FormState>();
  final ContactRequestDTO _model = ContactRequestDTO.empty();
  String? _error;

  @override
  void initState() {
    widget.viewModel.createCmd.addListener(_handleCreate);
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.createCmd.removeListener(_handleCreate);
    _imageController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleCreate() {
    final cmd = widget.viewModel.createCmd;
    final value = widget.viewModel.createCmd.value;

    switch (value) {
      case IdleCommand<EmergencyContactResponse>():
      case CancelledCommand<EmergencyContactResponse>():
      case RunningCommand<EmergencyContactResponse>():
        return;
      case FailureCommand<EmergencyContactResponse>():
        if (_error == null) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) setState(() => _error = value.error.toString());
          });
        }
        Future.delayed(const Duration(seconds: 5), () {
          _error = null;
          cmd.reset();
        });
        break;
      case SuccessCommand<EmergencyContactResponse>():
        Navigator.of(context).pop();
        Future.microtask(() {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => SuccessModal(
              title: 'Contato criado com sucesso!',
              message: 'O contato foi adicionado à sua lista de emergência.',
              onClose: () {
                cmd.reset();
              },
            ),
          );
        });
        break;
    }
  }

  bool _validateForm() {
    final isValid = _validador.validate(_model).isValid;
    return (_formKey.currentState!.validate() && isValid);
  }

  _saveForm() {
    if (_validateForm()) {
      widget.viewModel.createCmd.execute(
        CreateEmegergency(
          request: CreateEmergencyContactRequest(
            name: _model.nome,
            phone: _model.phone,
            serviceType: _model.type!,
          ),
          file: FileRequest(
            file: _imageController.bytes,
            fileName: _imageController.fileName,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.createCmd,
      builder: (context, _) {
        final isLoading = widget.viewModel.createCmd.value.isRunning;
        final value = widget.viewModel.createCmd.value;

        if (value.isSuccess) {
          return SizedBox.shrink();
        }

        return CustomModal(
          showClose: !isLoading,
          onClose: () async {
            widget.viewModel.createCmd.reset();
          },
          title: 'Cadastrar contato',
          helperActionButton: FilledButton(
            onPressed: isLoading ? null : _imageController.pick,
            child: Text('Carregar imagem'),
          ),
          primaryActionButton: FilledButton.icon(
            onPressed: isLoading ? null : _saveForm,
            label: Text('Salvar'),
            icon: Icon(Icons.save, size: 24),
            iconAlignment: IconAlignment.end,
          ),
          child: isLoading
              ? Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              : Stack(
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        ImageUploader(controller: _imageController),
                        Flexible(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 618,
                              minWidth: 617,
                            ),
                            child: EmergencyContactForm(
                              formKey: _formKey,
                              nameController: _nameController,
                              phoneController: _phoneController,
                              model: _model,
                              validator: _validador,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SnackBarDialog(error: _error),
                  ],
                ),
        );
      },
    );
  }
}

class SuccessModal extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onClose;

  const SuccessModal({
    super.key,
    required this.title,
    required this.message,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).colorScheme.primary,
              size: 64,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                onClose?.call();
              },
              child: const Text('Fechar'),
            ),
          ],
        ),
      ),
    );
  }
}

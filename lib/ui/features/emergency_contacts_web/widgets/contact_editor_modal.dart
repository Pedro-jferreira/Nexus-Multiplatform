import 'package:flutter/material.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:Nexus/domain/validators/emergency_validator.dart';
import 'package:Nexus/ui/core/modal/custom_modal.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/view_models/emergency_contact_view_model.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/widgets/snack_bar_dialog.dart';
import 'package:result_command/result_command.dart';

import '../../../core/widgets/image_uploader.dart';
import 'emergency_contact_form.dart';

class ContactEditorModal extends StatefulWidget {
  final EmergencyContactViewModel viewModel;
  final EmergencyContactResponse? model;

  const ContactEditorModal._({
    super.key,
    required this.viewModel,
    required this.model,
  });

  factory ContactEditorModal.create({
    Key? key,
    required EmergencyContactViewModel viewModel,
  }) {
    return ContactEditorModal._(key: key, viewModel: viewModel, model: null);
  }

  factory ContactEditorModal.edit({
    Key? key,
    required EmergencyContactViewModel viewModel,
    required EmergencyContactResponse model,
  }) {
    return ContactEditorModal._(key: key, viewModel: viewModel, model: model);
  }

  bool get isEdit => model != null;

  @override
  State<ContactEditorModal> createState() => _ContactEditorModalState();
}

class _ContactEditorModalState extends State<ContactEditorModal> {
  late final ImageUploadController _imageController;
  late final ContactRequestDTO _model;

  final ContactValidador _validador = ContactValidador();
  final _formKey = GlobalKey<FormState>();
  String? _error;

  @override
  void initState() {
    if (widget.isEdit) {
      final model = widget.model!;
      _model = ContactRequestDTO(
        nome: model.name,
        phone: model.phone,
        type: model.serviceType,
      );
      _imageController = ImageUploadController.fromUrl(model.images.first.url);
    } else {
      _model = ContactRequestDTO.empty();
      _imageController = ImageUploadController();
    }

    widget.viewModel.createCmd.addListener(_handleCreate);
    widget.viewModel.updateCmd.addListener(_handleUpdate);
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.createCmd.removeListener(_handleCreate);
    widget.viewModel.updateCmd.removeListener(_handleUpdate);
    _imageController.dispose();
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
        _emitError(value.error.toString(), onReset: cmd.reset);
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

  void _handleUpdate() {
    final cmd = widget.viewModel.updateCmd;
    final value = widget.viewModel.updateCmd.value;

    switch (value) {
      case IdleCommand<EmergencyContactResponse>():
      case CancelledCommand<EmergencyContactResponse>():
      case RunningCommand<EmergencyContactResponse>():
        return;
      case FailureCommand<EmergencyContactResponse>():
        _emitError(value.error.toString(), onReset: cmd.reset);
        break;
      case SuccessCommand<EmergencyContactResponse>():
        Navigator.of(context).pop();
        Future.microtask(() {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => SuccessModal(
              title: 'Contato Atualizado com sucesso!',
              message: 'O contato foi atualizado na sua lista de emergência.',
              onClose: () {
                cmd.reset();
              },
            ),
          );
        });
        break;
    }
  }

  void _emitError(String message, {VoidCallback? onReset}) {
    if (_error == null) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() => _error = message);
        }
      });
    }

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() => _error = null);
      }
      onReset?.call();
    });
  }

  bool _validateForm() {
    final isValid = _validador.validate(_model).isValid;
    return (_formKey.currentState!.validate() && isValid);
  }

  _saveForm() {
    if (!_validateForm()) return;
    if (_imageController.isLoading) {
      _emitError('Aguarde a imagem Carregar');
      return;
    }

    if (widget.isEdit && !_hasChanges()) {
      _emitError('Nenhuma alteração detectada.');
      return;
    }

    if (widget.isEdit) {
      widget.viewModel.updateCmd.execute(
        FilePayloadUpdate(
          id: widget.model!.id,
          request: UpdateEmergencyContactRequest(
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
    } else {
      widget.viewModel.createCmd.execute(
        FilePayload(
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

  bool _hasChanges() {
    if (!widget.isEdit) return true;

    final original = widget.model!;

    final bool nameChanged = _model.nome != original.name;
    final bool phoneChanged = _model.phone != original.phone;
    final bool typeChanged = _model.type != original.serviceType;
    final bool imageChanged = _imageController.cache.length > 1;

    return nameChanged || phoneChanged || typeChanged || imageChanged;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        widget.viewModel.createCmd,
        widget.viewModel.updateCmd,
      ]),
      builder: (context, _) {
        final isLoading =
            (widget.viewModel.createCmd.value.isRunning ||
            widget.viewModel.updateCmd.value.isRunning);
        final value = widget.isEdit
            ? widget.viewModel.updateCmd.value
            : widget.viewModel.createCmd.value;

        if (value.isSuccess) {
          return SizedBox.shrink();
        }

        return CustomModal(
          showClose: !isLoading,
          onClose: () async {
            widget.isEdit
                ? widget.viewModel.updateCmd.reset()
                : widget.viewModel.createCmd.reset();
          },
          title: widget.isEdit ? 'Editar contato' : 'Cadastrar contato',
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

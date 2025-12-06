import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/models/requests/gen_models.dart';
import '../../../../domain/validators/suspects.dart';
import '../../../core/modal/custom_modal.dart';
import '../../../core/widgets/image_uploader.dart';
import '../../emergency_contacts_web/widgets/contact_editor_modal.dart';
import '../../emergency_contacts_web/widgets/snack_bar_dialog.dart';
import '../view_models/suspect_view_model.dart';
import 'form_suspect.dart';

class SuspectEditorModal extends StatefulWidget {
  final SuspectViewModel viewModel;
  final SuspectResponse? model;

  const SuspectEditorModal._({
    super.key,
    required this.viewModel,
    required this.model,
  });

  factory SuspectEditorModal.create({Key? key, required SuspectViewModel viewModel}) {
    return SuspectEditorModal._(key: key, viewModel: viewModel, model: null);
  }

  factory SuspectEditorModal.edit({
    Key? key,
    required SuspectViewModel viewModel,
    required SuspectResponse model,
  }) {
    return SuspectEditorModal._(key: key, viewModel: viewModel, model: model);
  }

  bool get isEdit => model != null;

  @override
  State<SuspectEditorModal> createState() => _SuspectEditorModalState();
}

class _SuspectEditorModalState extends State<SuspectEditorModal> {
  final ImageUploadController _imageController = ImageUploadController();
  late final SuspectModel _model;
  late final SuspectValidator _validator;
  final _formKey = GlobalKey<FormState>();
  String? _error;

  @override
  void initState() {
    if (widget.isEdit) {
      final model = widget.model!;
      _model = SuspectModel(
          name: model.name,
          birthDate: model.birthDate,
          cpf: model.cpf,
          description: model.description,
      suspectStatus: model.suspectStatus);
      if (model.images.isNotEmpty) {
        _imageController.loadFromUrl(model.images.first.url);
      }
      _validator = SuspectValidator.edit();
    } else {
      _model = SuspectModel.empty();
      _validator = SuspectValidator.create();
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
      case IdleCommand<Unit>():
      case CancelledCommand<Unit>():
      case RunningCommand<Unit>():
        return;
      case FailureCommand<Unit>():
        _emitError(value.error.toString(), onReset: cmd.reset);
        break;
      case SuccessCommand<Unit>():
        Navigator.of(context).pop();
        Future.microtask(() {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => SuccessModal(
              title: 'Cadastro iniciado!',
              message: 'O usuário foi registrado e a imagem está sendo processada. '
                  'Você receberá uma notificação assim que o processamento for concluído.',
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
      case IdleCommand<SuspectResponse>():
      case CancelledCommand<SuspectResponse>():
      case RunningCommand<SuspectResponse>():
        return;
      case FailureCommand<SuspectResponse>():
        _emitError(value.error.toString(), onReset: cmd.reset);
        break;
      case SuccessCommand<SuspectResponse>():
        Navigator.of(context).pop();
        Future.microtask(() {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => SuccessModal(
              title: 'Suspeito Atualizado com sucesso!',
              message: 'O suspeito foi atualizado na sua lista de suspeitos.',
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
    final isValid = _validator.validate(_model).isValid;
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
          request: UpdateSuspectRequest(
              name: _model.name,
              birthDate: _model.birthDate!,
              cpf: _model.cpf,
              description: _model.description,
              suspectStatus: _model.suspectStatus!),
          file: FileRequest(
            file: null,
            fileName: null,
          ),
        ),
      );
    } else {
      if(_imageController.bytes == null){
        _emitError("Selecione uma imagem");
        return;
      }
      widget.viewModel.createCmd.execute(
        FilePayload(
          request: CreateSuspectRequest(
            name: _model.name,
            birthDate: _model.birthDate!,
            cpf: _model.cpf,
            description: _model.description),
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

    final bool nameChanged = _model.name != original.name;
    final bool cpfChanged = _model.cpf != original.cpf;
    final bool dateChanged = _model.birthDate != original.birthDate;
    final bool descriptionChanged   = _model.description != original.description;

    final bool statusChanged = _model.suspectStatus != original.suspectStatus;

    return nameChanged ||
        cpfChanged ||
        dateChanged ||
        descriptionChanged ||
        statusChanged;
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
          title: widget.isEdit ? 'Editar Suspeito' : 'Cadastrar Suspeito',
          primaryActionButton: FilledButton.icon(
            onPressed: isLoading ? null : _saveForm,
            label: Text('Salvar'),
            icon: Icon(Icons.save),
          ),
          helperActionButton: FilledButton(
            onPressed: isLoading ? null : _imageController.pick,
            child: Text('Carregar imagem'),
          ),
          child: isLoading
              ? Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
          )
              : Flexible(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20,
                  children: [
                    ImageUploader(readOnly:widget.isEdit,controller: _imageController),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 618,
                          minWidth: 617,
                        ),
                        child: SingleChildScrollView(
                          child: widget.isEdit
                              ? FormSuspect.edit(
                            formKey: _formKey,
                            model: _model,
                            validator: _validator,
                          )
                              : FormSuspect.create(
                            formKey: _formKey,
                            model: _model,
                            validator: _validator,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SnackBarDialog(error: _error),
              ],
            ),
          ),
        );
      },
    );
  }
}

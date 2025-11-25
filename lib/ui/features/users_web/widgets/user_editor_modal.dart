import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:Nexus/domain/validators/users_validators.dart';
import 'package:Nexus/ui/features/users_web/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/ui/core/modal/custom_modal.dart';
import 'package:Nexus/ui/core/widgets/image_uploader.dart';
import 'package:Nexus/ui/features/users_web/widgets/form_user.dart';
import 'package:result_command/result_command.dart';

import '../../../../domain/models/requests/gen_models.dart';
import '../../emergency_contacts_web/widgets/contact_editor_modal.dart';
import '../../emergency_contacts_web/widgets/snack_bar_dialog.dart';

class UserEditorModal extends StatefulWidget {
  final UserViewModel viewModel;
  final UserResponse? model;

  const UserEditorModal._({
    super.key,
    required this.viewModel,
    required this.model,
  });

  factory UserEditorModal.create({Key? key, required UserViewModel viewModel}) {
    return UserEditorModal._(key: key, viewModel: viewModel, model: null);
  }

  factory UserEditorModal.edit({
    Key? key,
    required UserViewModel viewModel,
    required UserResponse model,
  }) {
    return UserEditorModal._(key: key, viewModel: viewModel, model: model);
  }

  bool get isEdit => model != null;

  @override
  State<UserEditorModal> createState() => _UserEditorModalState();
}

class _UserEditorModalState extends State<UserEditorModal> {
  final ImageUploadController _imageController = ImageUploadController();
  late final UserModel _model;
  late final UsersValidador _validator;
  final _formKey = GlobalKey<FormState>();
  String? _error;

  @override
  void initState() {
    if (widget.isEdit) {
      final model = widget.model!;
      _model = UserModel(
        nome: model.name,
        email: model.email,
        role: model.role,
        status: (model.locked && model.enabled),
      );
      if (model.profileImageUrl != null) {
        _imageController.loadFromUrl(model.profileImageUrl!);
      }
      _validator = UsersValidador.edit();
    } else {
      _model = UserModel.empty();
      _validator = UsersValidador.create();
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
      case IdleCommand<UserResponse>():
      case CancelledCommand<UserResponse>():
      case RunningCommand<UserResponse>():
        return;
      case FailureCommand<UserResponse>():
        _emitError(value.error.toString(), onReset: cmd.reset);
        break;
      case SuccessCommand<UserResponse>():
        Navigator.of(context).pop();
        Future.microtask(() {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => SuccessModal(
              title: 'Usuário criado com sucesso!',
              message: 'O usuário foi adicionado à sua lista de usuários.',
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
      case IdleCommand<UserResponse>():
      case CancelledCommand<UserResponse>():
      case RunningCommand<UserResponse>():
        return;
      case FailureCommand<UserResponse>():
        _emitError(value.error.toString(), onReset: cmd.reset);
        break;
      case SuccessCommand<UserResponse>():
        Navigator.of(context).pop();
        Future.microtask(() {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => SuccessModal(
              title: 'Usuário Atualizado com sucesso!',
              message: 'O usuário foi atualizado na sua lista de usuários.',
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
          request: UpdateUserRequest(
            name: _model.nome,
            email: _model.email,
            role: _model.role!,
            enable: _model.status!,
            locked: _model.status!,
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
          request: CreateUserRequest(
            name: _model.nome,
            email: _model.email,
            role: _model.role!,
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
    final bool emailChanged = _model.email != original.email;
    final bool roleChanged = _model.role != original.role;
    final bool imageChanged = (original.profileImageUrl == null)
        ? _imageController.cache.isNotEmpty
        : _imageController.cache.length > 1;
    final bool statusChanged =
        _model.status != (original.locked && original.enabled);

    return nameChanged ||
        emailChanged ||
        roleChanged ||
        imageChanged ||
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
          title: widget.isEdit ? 'Editar Usuario' : 'Cadastrar usúario',
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
                          ImageUploader(controller: _imageController),
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 618,
                                minWidth: 617,
                              ),
                              child: SingleChildScrollView(
                                child: widget.isEdit
                                    ? FormUser.edit(
                                        formKey: _formKey,
                                        userModel: _model,
                                        validator: _validator,
                                      )
                                    : FormUser.create(
                                        formKey: _formKey,
                                        userModel: _model,
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

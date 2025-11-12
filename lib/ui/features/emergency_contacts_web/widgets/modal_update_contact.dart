import 'package:flutter/material.dart';
import 'package:nexus_multiplatform/domain/models/responses/gen_models.dart';
import 'package:nexus_multiplatform/ui/features/emergency_contacts_web/view_models/emergency_contact_view_model.dart';
import 'package:nexus_multiplatform/ui/features/emergency_contacts_web/widgets/snack_bar_dialog.dart';
import 'package:result_command/result_command.dart';

import '../../../../domain/models/requests/gen_models.dart';
import '../../../../domain/validators/emergency_validator.dart';
import '../../../core/modal/custom_modal.dart';
import 'emergency_contact_form.dart';
import 'modal_create_contact.dart';

class ModalUpdateContact extends StatefulWidget {
  final EmergencyContactViewModel viewModel;
  final EmergencyContactResponse model;
  const ModalUpdateContact({super.key, required this.viewModel, required this.model});

  @override
  State<ModalUpdateContact> createState() => _ModalUpdateContactState();
}

class _ModalUpdateContactState extends State<ModalUpdateContact> {
  late final TextEditingController _nameController;
  late  final TextEditingController _phoneController;
  late ContactRequestDTO _contactRequest;

  final ContactValidador _validador = ContactValidador();
  final _formKey = GlobalKey<FormState>();
  String? _error;

  @override
  void initState() {

    final model = widget.model;
    _nameController = TextEditingController(text: model.name);
    _phoneController = TextEditingController(text: model.phone);
    _contactRequest = ContactRequestDTO(nome: model.name, phone: model.phone, type: model.serviceType);
    widget.viewModel.updateCmd.addListener(_handleUpdate);
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.updateCmd.removeListener(_handleUpdate);
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
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

  bool _validateForm() {
    final isValid = _validador.validate(_contactRequest).isValid;
    return (_formKey.currentState!.validate() && isValid);
  }

  _saveForm() {
    if (_validateForm()) {
      widget.viewModel.updateCmd.execute(
        widget.model.id,
       UpdateEmergencyContactRequest(
            name: _contactRequest.nome,
            phone: _contactRequest.phone,
            serviceType: _contactRequest.type!,
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.updateCmd,
      builder: (context, _) {
        final isLoading = widget.viewModel.updateCmd.value.isRunning;
        final value = widget.viewModel.updateCmd.value;

        if (value.isSuccess) {
          return SizedBox.shrink();
        }

        return CustomModal(
          showClose: !isLoading,
          onClose: () async {
            widget.viewModel.updateCmd.reset();
          },
          title: 'Editar contato',

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
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 618,
                  minWidth: 617,
                ),
                child: EmergencyContactForm(
                  formKey: _formKey,
                  nameController: _nameController,
                  phoneController: _phoneController,
                  model: _contactRequest,
                  validator: _validador,
                ),
              ),
              SnackBarDialog(error: _error),
            ],
          ),
        );
      },
    );
  }
}

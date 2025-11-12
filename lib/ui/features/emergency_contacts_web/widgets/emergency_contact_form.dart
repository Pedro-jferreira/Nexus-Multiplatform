import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexus_multiplatform/domain/validators/emergency_validator.dart';

import '../../../../domain/models/enums/api_enums.dart';

extension ServiceTypeExtension on ServiceType {
  String get label {
    switch (this) {
      case ServiceType.SAMU:
        return 'SAMU';
      case ServiceType.BOMBEIROS:
        return 'Bombeiros';
      case ServiceType.PM:
        return 'Polícia Militar';
      case ServiceType.OUTRO:
        return 'Outro';
    }
  }
}

class EmergencyContactForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final ContactRequestDTO model;
  final ContactValidador validator;
  final GlobalKey formKey;

  const EmergencyContactForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.model,
    required this.validator,
    required this.formKey,
  });

  @override
  State<EmergencyContactForm> createState() => _EmergencyContactFormState();
}

class _EmergencyContactFormState extends State<EmergencyContactForm> {
  late final FocusNode _nameFocusNode;
  late final FocusNode _phoneFocusNode;
  late final FocusNode _serviceFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _serviceFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _serviceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,

      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome
          TextFormField(
            focusNode: _nameFocusNode,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_phoneFocusNode),
            controller: widget.nameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.model.setNome,
            validator: widget.validator.byField(widget.model, 'nome'),
            decoration: const InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(),
            ),
          ),

          TextFormField(
            focusNode: _phoneFocusNode,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_serviceFocusNode),
            controller: widget.phoneController,
            onChanged: widget.model.setPhone,
            validator: widget.validator.byField(widget.model, 'phone'),
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\s()+-]')),
            ],
            decoration: const InputDecoration(
              labelText: 'Telefone',
              hintText: 'Ex: 190 ou (62) 99999-9999',
              border: OutlineInputBorder(),
            ),
          ),
          DropdownButtonFormField<ServiceType>(
            focusNode: _serviceFocusNode,
            initialValue: widget.model.type,
            onChanged: widget.model.setType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Tipo de serviço',
              border: OutlineInputBorder(),
            ),
            items: ServiceType.values
                .map(
                  (type) => DropdownMenuItem<ServiceType>(
                    value: type,
                    child: Text(type.label),
                  ),
                )
                .toList(),
            validator: (value) =>
                value == null ? 'Selecione um tipo de serviço' : null,
            onTap:FocusScope.of(context).unfocus,
          ),
        ],
      ),
    );
  }
}

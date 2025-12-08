import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../domain/models/enums/api_enums.dart';
import '../../../../domain/validators/suspects.dart';

class FormSuspect extends StatefulWidget {
  final GlobalKey formKey;
  final SuspectModel model;
  final SuspectValidator validator;
  final bool isEditing;

  const FormSuspect._({
    super.key,
    required this.formKey,
    required this.model,
    required this.validator,
    required this.isEditing,
  });
  factory FormSuspect.create({
    Key? key,
    required GlobalKey formKey,
    required SuspectModel model,
    required SuspectValidator validator,
  }) {
    return FormSuspect._(
      key: key,
      formKey: formKey,
      model: model,
      validator: validator,
      isEditing: false,
    );
  }

  factory FormSuspect.edit({
    Key? key,
    required GlobalKey formKey,
    required SuspectModel model,
    required SuspectValidator validator,
  }) {
    return FormSuspect._(
      key: key,
      formKey: formKey,
      model: model,
      validator: validator,
      isEditing: true,
    );
  }
  @override
  State<FormSuspect> createState() => _FormSuspectState();
}

class _FormSuspectState extends State<FormSuspect> {
  final nameFocus = FocusNode();
  final dateFocus = FocusNode();
  final cpfFocus = FocusNode();
  final descriptionFocus = FocusNode();
  final statusFocus = FocusNode();

  // Formatters (Máscaras)
  final dateFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void dispose() {
    nameFocus.dispose();
    dateFocus.dispose();
    cpfFocus.dispose();
    descriptionFocus.dispose();
    statusFocus.dispose();
    super.dispose();
  }

  void _onDateChanged(String value) {

      if (value.length == 10) {
        try {
          final date = DateFormat('dd/MM/yyyy').parse(value);
          widget.model.setBirthDate(date);
        } catch (e) {
          widget.model.setBirthDate(null);
        }
      } else {
        widget.model.setBirthDate(null);
      }
      _birthDateKey.currentState?.validate();
  }

  String? _getInitialDate() {
    if (widget.model.birthDate != null) {
      return DateFormat('dd/MM/yyyy').format(widget.model.birthDate!);
    }
    return null;
  }
  final _birthDateKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 25,
        children: [
          TextFormField(
            initialValue: widget.model.name,
            onChanged: widget.model.setName,
            focusNode: nameFocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(dateFocus),
            validator: widget.validator.byField(widget.model, 'name'),
            decoration: const InputDecoration(
              labelText: 'Nome do Suspeito',
              hintText: 'Digite o nome completo',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),

          TextFormField(
            key: _birthDateKey,
            initialValue: _getInitialDate(),
            focusNode: dateFocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [dateFormatter],
            onChanged: _onDateChanged,
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(cpfFocus),
            validator: widget.validator.byField(widget.model, 'birthDate'),
            decoration: const InputDecoration(
              labelText: 'Data de Nascimento',
              hintText: 'dd/mm/aaaa',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.calendar_today),
            ),
          ),

          TextFormField(
            initialValue: widget.model.cpf,
            onChanged:widget.model.setCpf,
            focusNode: cpfFocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [cpfFormatter],
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(descriptionFocus),
            validator: widget.validator.byField(widget.model, 'cpf'),
            decoration: const InputDecoration(
              labelText: 'CPF',
              hintText: '000.000.000-00',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.badge),
            ),
          ),
          TextFormField(
            initialValue: widget.model.description,
            onChanged: widget.model.setDescription,
            focusNode: descriptionFocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.newline,
            minLines: 1,
            maxLines: 3,
            validator: widget.validator.byField(widget.model, 'description'),
            decoration: InputDecoration(
              labelText: 'Descrição / Características',
              hintText: 'Tatuagens, altura, cicatrizes...',
              border: const OutlineInputBorder(),
              prefixIcon:Icon(Icons.description),

              alignLabelWithHint: false,
            ),
          ),
          if (widget.isEditing)
            DropdownButtonFormField<SuspectStatus>(
              initialValue: widget.model.suspectStatus,
              onChanged: widget.model.setStatus,
              focusNode: statusFocus,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Status do Suspeito',
                hintText: 'Selecione a situação atual',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.gavel),
              ),
              items: SuspectStatus.values
                  .map(
                    (status) => DropdownMenuItem<SuspectStatus>(
                  value: status,
                  child: Text(status.name.toUpperCase()),
                ),
              )
                  .toList(),
              validator: (value) => widget.validator
                  .byField(widget.model, 'suspectStatus')(value?.toString()),
              onTap: FocusScope.of(context).unfocus,
            ),
        ],
      ),
    );
  }
}

import 'package:Nexus/domain/models/enums/api_enums.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/guards/roles.dart';

import '../../../../domain/validators/users_validators.dart';

class FormUser extends StatefulWidget {
  final GlobalKey formKey;
  final UserModel userModel;
  final UsersValidador validator;

  final bool isEditing;

  const FormUser._({
    super.key,
    required this.formKey,
    required this.userModel,
    required this.validator,
    required this.isEditing,
  });

  factory FormUser.create({
    Key? key,
    required GlobalKey formKey,
    required UserModel userModel,
    required UsersValidador validator,
  }) {
    return FormUser._(
      key: key,
      formKey: formKey,
      userModel: userModel,
      validator: validator,
      isEditing: false,
    );
  }

  factory FormUser.edit({
    Key? key,
    required GlobalKey formKey,
    required UserModel userModel,
    required UsersValidador validator,
  }) {
    return FormUser._(
      key: key,
      formKey: formKey,
      userModel: userModel,
      validator: validator,
      isEditing: true,
    );
  }
  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
   final nameFocus = FocusNode();
   final emailFocus = FocusNode();
   final roleFocus = FocusNode();


  @override
  void dispose() {
    nameFocus.dispose();
    emailFocus.dispose();
    roleFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 25,
        children: [
          TextFormField(
            initialValue:widget.userModel.nome ,
            onChanged: widget.userModel.setNome,
            focusNode: nameFocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(emailFocus),
            validator: widget.validator.byField(widget.userModel, 'nome'),
            decoration: InputDecoration(
              labelText: 'Nome Completo',
              hintText: 'Digite seu nome completo',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            initialValue:widget.userModel.email ,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: emailFocus,
            onChanged: widget.userModel.setEmail,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(roleFocus),
            validator: widget.validator.byField(widget.userModel, 'email'),
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Digite seu e-mail',
              border: OutlineInputBorder(),
            ),
          ),
          DropdownButtonFormField<Role>(
            onChanged: widget.userModel.setRole,
            initialValue: widget.userModel.role,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Cargo',
              hintText: 'Selecione um cargo',
              border: OutlineInputBorder(),
            ),
            items: Role.values
                .map(
                  (type) => DropdownMenuItem<Role>(
                    value: type,
                    child: Text(type.label),
                  ),
                )
                .toList(),
            validator: (value) =>
                widget.validator.byField(widget.userModel, 'role')(value?.toString()),
            onTap: FocusScope.of(context).unfocus,
          ),
          if(widget.isEditing)
          DropdownButtonFormField<EnumStatus>(
            initialValue: widget.userModel.status,
            onChanged: widget.userModel.setStatus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Status',
              hintText: 'Selecione um status',
              border: OutlineInputBorder(),
            ),
            items: EnumStatus.values
                .map(
                  (type) => DropdownMenuItem<EnumStatus>(
                value: type,
                child: Text(type.name),
              ),
            )
                .toList(),
            validator: (value) =>
                widget.validator.byField(widget.userModel, 'status')(value?.toString()),
            onTap: FocusScope.of(context).unfocus,
          ),
        ],
      ),
    );
  }
}

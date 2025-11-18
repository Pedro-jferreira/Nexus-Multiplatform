import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/guards/roles.dart';

import '../../../../domain/models/responses/gen_models.dart';

extension RoleExtension on Role {
  String get label {
    switch (this) {
      case Role.ADMIN:
        return 'Administrador';
      case Role.SECURITY:
        return 'Segurança';
    }
  }
}

class FormCreateUser extends StatelessWidget {
  final GlobalKey formKey;

  const FormCreateUser({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 25,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome Completo',
              hintText: 'Digite seu nome completo',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Digite seu e-mail',
              border: OutlineInputBorder(),
            ),
          ),
          DropdownButtonFormField<Role>(
            onChanged: (value) {},
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
            validator: (value) => value == null ? 'Selecione um Cargo' : null,
            onTap: FocusScope.of(context).unfocus,
          ),
          DropdownButtonFormField<bool>(
            onChanged: (value) {},
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Status',
              hintText: 'Selecione um status',
              border: OutlineInputBorder(),
            ),
            items: [
              DropdownMenuItem<bool>(value: true, child: Text('Ativo')),
              DropdownMenuItem<bool>(value: false, child: Text('Bloqueado')),
            ],
            validator: (value) => value == null ? 'Selecione um status' : null,
            onTap: FocusScope.of(context).unfocus,
          ),

          DropdownSearch<UserModel>(
            items: (f, cs) => getData(f),
            suffixProps: DropdownSuffixProps(
              clearButtonProps: ClearButtonProps(isVisible: true,tooltip: 'Remover'),
            ),
            compareFn: (item, selectedItem) => item.id == selectedItem.id,
            dropdownBuilder: (context, selectedItem) {
              if (selectedItem == null) {
                return SizedBox.shrink();
              }

              return ListTile(
                contentPadding: EdgeInsets.only(left: 0),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(selectedItem.name[0]),
                ),
                title: Text(selectedItem.name),
              );
            },
            popupProps: PopupProps.menu(
              disableFilter: true, //data will be filtered by the backend
              showSearchBox: true,
              showSelectedItems: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  labelText: 'Pesquisar',
                  hintText: 'Digite um nome',
                  suffixIcon: Icon(Icons.search_rounded),

                  border: OutlineInputBorder()
                )
              ),
              itemBuilder: (ctx, item, isDisabled, isSelected) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(item.name[0]),
                  ),
                  selected: isSelected,
                  title: Text(item.name),
                );
              },
            ),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'Responsável',
                hintText: "Selecione um Responsável",
                border: OutlineInputBorder()
              )
            ),
          ),
        ],
      ),
    );
  }
}

class UserModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  UserModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt: DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#$id $name';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return createdAt.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return id == model.id;
  }

  @override
  String toString() => name;
}

Future<List<UserModel>> getData(filter) async {
  var response = await Dio().get(
    "https://63c1210999c0a15d28e1ec1d.mockapi.io/users",
    queryParameters: {"filter": filter},
  );

  final data = response.data;
  if (data != null) {
    return UserModel.fromJsonList(data);
  }

  return [];
}

import 'package:flutter/material.dart';
import 'package:Nexus/guards/roles.dart';
import 'package:Nexus/ui/features/users_web/widgets/modal_create_user.dart';
import 'package:Nexus/ui/features/users_web/widgets/user_tile.dart';

import '../../core/layout/custom_app_bar.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {


  _onCreate(){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return ModalCreateUser();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 42,
      children: [
        CustomAppBar(
          title: 'Gerenciamento de usuários',
          primaryActionButton: FilledButton.icon(
            onPressed: _onCreate,
            label: Text('Adicionar contato'),
            icon: Icon(Icons.person_add_alt_1_outlined, size: 24),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              UserTile(nome: 'pedro', role: Role.ADMIN, status: 'ativo')
            ],
          ),
        ),
      ],
    );
  }
}

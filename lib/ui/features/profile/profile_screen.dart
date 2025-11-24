import 'package:Nexus/ui/features/profile/user.dart';
import 'package:flutter/material.dart';

import 'widgets/account_settings_card.dart';
import 'widgets/theme_switcher_card.dart';
import 'widgets/user_profile_card.dart';
// Importa os arquivos dos componentes e do modelo


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Inicializa o Future para buscar os dados uma única vez
  late Future<User> _userDataFuture;
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _userDataFuture = _userService.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: false,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            spacing: 20,
            children: <Widget>[
              const Center(
                child: Text(
                  'Meu Perfil',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // O FutureBuilder LIDA COM O DADO DA API
              FutureBuilder<User>(
                future: _userDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Estado de Carregamento
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // Estado de Erro
                    return Center(child: Text('Erro ao carregar perfil: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    // Estado de Dados Prontos: exibe o componente com os dados
                    return UserProfileCard(user: snapshot.data!);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const AccountSettingsCard(),
              const ThemeSwitcherCard(),

              ElevatedButton.icon(
                onPressed: () {
                  // Lógica de Logout
                },
                icon: const Icon(Icons.logout, size: 24),
                label: const Text('Sair', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(90,37),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
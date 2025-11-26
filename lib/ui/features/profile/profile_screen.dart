import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/profile_view_model.dart';
import 'widgets/account_settings_card.dart';
import 'widgets/theme_switcher_card.dart';
import 'widgets/user_profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int currentUserId = 1;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(
        context,
        listen: false,
      ).loadUserProfile(userId: currentUserId);
    });
    return Scaffold(
      appBar: AppBar(title: const Text(''), centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<ProfileViewModel>(
          builder: (context, viewModel, child) {
            Widget content;
            if (viewModel.isLoading) {

              content = const Center(child: CircularProgressIndicator());
            } else if (viewModel.errorMessage != null) {
              content = Center(
                child: Text(
                  'Erro ao carregar perfil: ${viewModel.errorMessage}',
                ),
              );
            } else if (viewModel.user != null) {
              content = UserProfileCard(
                userData: viewModel.user,
              );
            } else {
              content = const SizedBox.shrink();
            }
            return Column(
              spacing: 20,
              children: <Widget>[
                const Center(
                  child: Text('Meu Perfil', style: TextStyle(fontSize: 24)),
                ),

                const AccountSettingsCard(),
                const ThemeSwitcherCard(),
                const Spacer(),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout, size: 24),
                  label: const Text('Sair', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(90, 37),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

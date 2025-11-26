import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:Nexus/routing/routes/web/app_router_web.dart';
import 'package:Nexus/ui/core/layout/custom_app_bar.dart';
import 'package:Nexus/ui/features/profile_web/view_model/profile_view_model.dart';
import 'package:Nexus/ui/features/profile_web/widgets/account_settings.dart';
import 'package:Nexus/ui/features/profile_web/widgets/profile_card.dart';
import 'package:Nexus/ui/features/profile_web/widgets/theme_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ProfileViewModel(repository: context.read<AuthRepository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: _viewModel, builder: (context,_){
      final user = _viewModel.user;

      if(user == null){
        return Center(child: Text('Não foi Possível carrgar o usuário'),);
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 47,
        children: [
          CustomAppBar(title: 'Meu perfil', centerTitle: true,),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 33,
                  runSpacing: 20,
                  runAlignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    ProfileCard(name: user.name,email: user.email,profileImg: user.profileImageUrl,),
                    Wrap(
                      spacing: 20,
                      direction: Axis.vertical,
                      children: [
                        AccountSettings(
                          onResetPassword: () => ResetPasswordRoute().go(context),
                        ),
                        ThemeCard()
                      ],
                    )

                  ],
                ),
              ),
            ),
          )

        ],
      );
    });
  }
}

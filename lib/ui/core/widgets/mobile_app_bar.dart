import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:Nexus/ui/core/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/ui/core/theme/theme_mobile.dart';
import 'package:provider/provider.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(74);
}

class _MobileAppBarState extends State<MobileAppBar> {
  String? imgUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final repository = context.read<AuthRepository>();
      final currentUser = repository.currentUser;

      setState(() {
        imgUrl = currentUser?.profileImageUrl;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.primaryMain,
      leadingWidth: 134, // 114 de tamanho mais 20 de espaçamento
      leading: Padding(
        padding: const EdgeInsets.only(left: 50, top: 11),
        child: SizedBox(
          width: 104,
          height: 52,
          child: Image.asset(
            'assets/logos/Logo_sigla_branco.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 50, top: 11),
          child: CustomCircleAvatar(
            iconData: Icons.person_rounded,
            imageUrl: imgUrl,
            height: 44,
            width: 44,
          ),
        ),
      ],
    );
  }
}

import 'package:Nexus/ui/core/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/ui/core/theme/theme_mobile.dart';

class ShellMobileAppBar extends StatefulWidget implements PreferredSizeWidget{
  const ShellMobileAppBar({super.key});

  @override
  State<ShellMobileAppBar> createState() => _ShellMobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ShellMobileAppBarState extends State<ShellMobileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.primaryMain,
      leading: Image.asset('assets/logos/Logo_sigla_branco.png'),
      actionsIconTheme: IconThemeData(color: context.colors.surface),
      actions: [
        CustomCircleAvatar(iconData: Icons.person,),
      ],
    );
  }
}

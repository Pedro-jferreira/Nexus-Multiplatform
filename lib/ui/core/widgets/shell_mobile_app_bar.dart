import 'package:Nexus/ui/core/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/ui/core/theme/theme_mobile.dart';

class ShellMobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ShellMobileAppBar({super.key});

  @override
  State<ShellMobileAppBar> createState() => _ShellMobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(74);
}

class _ShellMobileAppBarState extends State<ShellMobileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.primaryMain,
      leadingWidth: 134,
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
            iconData: Icons.person,
            height: 44,
            width: 44,
          ),
        ),
      ],
    );
  }
}

import 'package:Nexus/ui/core/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;
  final  void Function()? onLogout;
  final String? profileUrl;

  const CustomNavigationDrawer({
    super.key,
    required this.currentIndex,
    required this.onItemSelected, this.onLogout, this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final items = [
      _DrawerItem(title: 'Dashboard', icon: Icons.dashboard_outlined),
      _DrawerItem(title: 'Foragidos', icon: Icons.person_search_outlined),
      _DrawerItem(title: 'Usuários', icon: Icons.groups_outlined),
      _DrawerItem(title: 'Chats', icon: Icons.chat_outlined),
      _DrawerItem(title: 'Incidentes', icon: Icons.report_outlined),
      _DrawerItem(
        title: 'Contato de Emergência',
        icon: Icons.contact_emergency_outlined,
      ),
      _DrawerItem(title: 'Perfil', icon: Icons.person, subtitle: 'Admin'),
    ];

    return Drawer(
      backgroundColor: colorScheme.surfaceContainerLowest,
      elevation: 5,
      shadowColor: colorScheme.shadow,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Image.asset(
                            theme.brightness == Brightness.dark
                                ? 'assets/logos/Logo_sigla_branco.png'
                                : 'assets/logos/Logo_sigla_horizontal.png',
                            height: 45,
                          ),
                        ),

                        const Divider(thickness: 1),
                        ...items.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;

                          if (index == items.length - 1) {
                            return const SizedBox.shrink();
                          }
                          final selected = currentIndex == index;
                          return _DrawerTile(
                            item: item,
                            selected: selected,
                            onTap: () => onItemSelected(index),
                          );
                        }),
                        const Divider(thickness: 1),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            hoverColor: colorScheme.secondary.withValues(
                              alpha: 0.15,
                            ),
                            onTap: () => onItemSelected(items.length - 1),
                            child: Container(
                              decoration: BoxDecoration(
                                color: currentIndex == (items.length - 1)
                                    ? colorScheme.secondaryContainer
                                    : null,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: EdgeInsets.all(5),
                              child: Row(
                                spacing: 5,
                                children: [
                                  CustomCircleAvatar(
                                    iconData: Icons.person,
                                    imageUrl: profileUrl,
                                    width: 47,
                                    height: 47,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        items.last.title,
                                        style: theme.textTheme.bodyLarge
                                            ?.copyWith(
                                              color:
                                                  currentIndex ==
                                                      items.length - 1
                                                  ? colorScheme
                                                        .onSecondaryContainer
                                                  : colorScheme.onSurface,
                                            ),
                                      ),
                                      if (items.last.subtitle != null)
                                        Text(
                                          items.last.subtitle!,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color:
                                                    currentIndex ==
                                                        items.length - 1
                                                    ? colorScheme.onSecondary
                                                    : colorScheme
                                                          .onSurfaceVariant,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                    ],
                                  ),
                                  Spacer(),
                                  FilledButton.icon(
                                    icon: const Icon(Icons.logout, size: 24),
                                    onPressed: onLogout,
                                    label: Text('Sair'),
                                    style: FilledButton.styleFrom(
                                      padding: EdgeInsets.all(16),
                                      backgroundColor:
                                          colorScheme.errorContainer,
                                      foregroundColor:
                                          colorScheme.onErrorContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final _DrawerItem item;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final bgColor = selected
        ? colorScheme.secondaryContainer
        : Colors.transparent;

    final iconColor = selected
        ? colorScheme.onSecondaryContainer
        : colorScheme.onSurfaceVariant;

    final textColor = iconColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        hoverColor: colorScheme.secondary.withValues(alpha: 0.15),
        leading: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Icon(item.icon, key: ValueKey(selected), color: iconColor),
        ),

        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: textColor),
          child: Text(item.title),
        ),

        subtitle: item.subtitle == null
            ? null
            : AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                child: Text(item.subtitle!),
              ),
      ),
    );
  }
}

class _DrawerItem {
  final String title;
  final IconData icon;
  final String? subtitle;

  _DrawerItem({required this.title, required this.icon, this.subtitle});
}

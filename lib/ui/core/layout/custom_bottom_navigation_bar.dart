import 'package:flutter/material.dart';
import 'package:Nexus/ui/core/theme/theme_mobile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final items = <NavigationDestination>[
      NavigationDestination(
        icon: Icon(
          Icons.notifications_outlined,
          color: context.colors.primarySubtle,
        ),
        label: "Alertas",
      ),
      NavigationDestination(
        icon: Icon(
          Icons.chat_bubble_outline,
          color: context.colors.primarySubtle,
        ),
        label: "Chat",
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline, color: context.colors.primarySubtle),
        label: "Contatos",
      ),
    ];

    return NavigationBar(
      labelTextStyle: WidgetStateProperty.all(
        Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colors.primarySubtle,
        ),
      ),
      destinations: items,
      selectedIndex: widget.currentIndex,
      indicatorColor: context.colors.primaryEmphasis,
      onDestinationSelected: widget.onTap,
      backgroundColor: context.colors.primaryMain,
    );
  }
}

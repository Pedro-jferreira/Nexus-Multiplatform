import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget{
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTap,});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final items = const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.add_alert_outlined),
        label: "Alertas",
        activeIcon: Icon(Icons.add_alert_rounded)
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline),
        label: "Chat",
        activeIcon: Icon(Icons.chat_bubble_rounded)
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "Contatos",
        activeIcon: Icon(Icons.person_rounded)
      )
    ];

    return BottomNavigationBar(
        items: items,
        currentIndex: widget.currentIndex,
        fixedColor: colorScheme.surface,
        onTap: widget.onTap,
        type: BottomNavigationBarType.shifting,
        backgroundColor: colorScheme.primaryContainer,
        iconSize: 24,
    );
  }
}
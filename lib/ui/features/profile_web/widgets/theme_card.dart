import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/theme_control_view_model.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 22),
        constraints: BoxConstraints(maxWidth: 397),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tema:',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wb_sunny_outlined),
                Consumer<ThemeControlViewModel>(
                  builder: (context, vm, _) {
                    return Switch(
                      value: vm.isDarkMode,
                      onChanged: vm.changeTheme,
                    );
                  },
                ),
                Icon(Icons.bedtime_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

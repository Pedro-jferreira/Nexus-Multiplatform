import 'package:flutter/material.dart';

class ThemeSwitcherCard extends StatelessWidget {
  const ThemeSwitcherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Tema:',
            ),
            Switch(
              value: false,
              onChanged: (bool value) {
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ThemeSwitcherCard extends StatelessWidget {
  const ThemeSwitcherCard({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTA: Para um funcionamento real, este widget precisaria ser um StatefulWidget ou
    // usar um gerenciador de estado (Provider, BLoC, Riverpod)
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            // Switch de Exemplo
            Switch(
              value: true, // Simula Tema Claro Ativo
              onChanged: (bool value) {
              },
            ),
          ],
        ),
      ),
    );
  }
}
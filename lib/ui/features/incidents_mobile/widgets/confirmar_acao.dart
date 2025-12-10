import 'package:flutter/material.dart';

class ConfirmarAcao extends StatelessWidget {
  final VoidCallback onPressedAccept;
  final VoidCallback onPressedCancel;

  const ConfirmarAcao({
    super.key,
    required this.onPressedCancel,
    required this.onPressedAccept,
  });

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Row _sectionButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onPressedAccept,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(121, 172, 255, 1),
            elevation: 0.30,
            textStyle: TextStyle(color: colorScheme.surface),
          ),
          child: Text("Sim"),
        ),
        ElevatedButton(
          onPressed: onPressedCancel,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.surface,
              elevation: 0.30,
            textStyle: TextStyle(color: colorScheme.primary),
            shape: CircleBorder(side: BorderSide(color: Color.fromARGB(178, 178, 178, 1)))
          ),
          child: Text("Sim"),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TileIncident extends StatelessWidget {
  final String name;
  final DateTime birthDate;
  final String cpf;
  final String description;

  const TileIncident({
    super.key,
    required this.name,
    required this.birthDate,
    required this.cpf,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

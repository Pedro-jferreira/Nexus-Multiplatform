import 'package:flutter/material.dart';

class TileIncident extends StatelessWidget {
  final String name;
  final String foto;
  final String camera;
  final DateTime dataCaptura;
  final double similaridade;

  const TileIncident({
    super.key,
    required this.name,
    required this.foto,
    required this.camera,
    required this.dataCaptura,
    required this.similaridade,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

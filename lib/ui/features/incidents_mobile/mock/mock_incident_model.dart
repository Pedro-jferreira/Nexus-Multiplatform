class IncidentModel {
  final String nome;
  final String fotoUrl;
  final String camera;
  final double grauSimilaridade;
  final String dataCaptura;
  final void Function()? onTap;

  IncidentModel({
    required this.nome,
    required this.fotoUrl,
    required this.camera,
    required this.grauSimilaridade,
    required this.dataCaptura,
    this.onTap,
  });
}

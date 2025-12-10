class IncidentModel {
  final String nome;
  final String fotoUrl;
  final String fotoReferenciaUrl;
  final String camera;
  final double grauSimilaridade;
  final String dataCaptura;
  final String dataCompleta;
  final String horaExata;
  final String aniversario;
  final String status;

  IncidentModel({
    required this.nome,
    required this.fotoUrl,
    required this.fotoReferenciaUrl,
    required this.camera,
    required this.grauSimilaridade,
    required this.dataCaptura,
    required this.dataCompleta,
    required this.horaExata,
    required this.aniversario,
    required this.status,
  });
}
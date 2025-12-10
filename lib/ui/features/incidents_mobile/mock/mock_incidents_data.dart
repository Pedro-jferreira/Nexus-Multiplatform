import 'package:Nexus/ui/features/incidents_mobile/mock/mock_incident_model.dart';

class MockIncidents {
  static List<IncidentModel> incidents = [
    IncidentModel(
      nome: "Walmir Cardoso dos Santos Rosa",
      camera: "Câmera 05 - Praça",
      grauSimilaridade: 0.98,
      fotoUrl: "assets/images/foto1_suspeito.png",
      dataCaptura: "Hoje, 23:50",
    ),
    IncidentModel(
        nome: "Adriana de Sá Soares",
        camera: "Câmera 03 - Shopping",
        grauSimilaridade: 0.98,
        fotoUrl: "assets/images/foto1_suspeito.png",
        dataCaptura: "Ontem, 21:29"
    ),
    IncidentModel(
        nome: "Isaias Valdemir",
        camera: "Câmera 02 - Acesso Estacionamento",
        grauSimilaridade: 0.90,
        fotoUrl: "assets/images/foto1_suspeito.png",
        dataCaptura: "Há 2 dias, 14:03"
    ),
    IncidentModel(
        nome: "Pedro Henrique Marques",
        camera: "Câmera 01 - Marginal Botafogo",
        grauSimilaridade: 0.88,
        fotoUrl: "assets/images/foto1_suspeito.png",
        dataCaptura: "Há 1 semana, 02:10"
    ),
  ];
}
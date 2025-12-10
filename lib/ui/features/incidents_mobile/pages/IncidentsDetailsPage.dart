import 'package:flutter/material.dart';
import 'package:Nexus/ui/features/incidents_mobile/mock/mock_incident_model.dart';

class IncidentsDetailsPage extends StatelessWidget {
  final IncidentModel incident;

  const IncidentsDetailsPage({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFFEBEBEB);
    final cardColor = const Color(0xFFEBEBEB);
    final borderColor = const Color(0xFFD1D1D1);

    return Container(
      color: bgColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPhotosCard(incident, cardColor, borderColor),

            const SizedBox(height: 16),

            _buildInfoCard(
              title: "Dados do Foragido",
              icon: Icons.person_outline,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabelValue("Nome", incident.nome),
                  const SizedBox(height: 4),
                  _buildLabelValue("Aniversário", incident.aniversario),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black87, fontSize: 14),
                      children: [
                        const TextSpan(text: "Status: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: incident.status,
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bgColor: cardColor,
              borderColor: borderColor,
            ),

            const SizedBox(height: 16),

            _buildInfoCard(
              title: "Dados da Detecção",
              icon: Icons.warning_amber_rounded,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabelValue("Local", incident.camera.split('-').first.trim()),
                  const SizedBox(height: 4),
                  _buildLabelValue("Data", incident.dataCompleta),
                  const SizedBox(height: 4),
                  _buildLabelValue("Hora", incident.horaExata),
                ],
              ),
              bgColor: cardColor,
              borderColor: borderColor,
            ),

            const SizedBox(height: 16),

            _buildInfoCard(
              title: "Ações",
              icon: Icons.tune,
              content: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D47A1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text("Marcar como Falso Positivo", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00796B),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {},
                          child: const Text("Conversar com Admin",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4DB6AC),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {},
                          child: const Text("Acionar Emergência",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              bgColor: cardColor,
              borderColor: borderColor,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotosCard(IncidentModel incident, Color bgColor, Color borderColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              children: [
                const TextSpan(text: "Grau de Similaridade: ", style: TextStyle(color: Colors.black87)),
                TextSpan(
                  text: "${(incident.grauSimilaridade * 100).toInt()}%",
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Text("Imagem de Referência:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Container(
            height: 150,
            width: 150,
            color: const Color(0xFF4DB6AC),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                incident.fotoReferenciaUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image, color: Colors.white));
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text("Imagem Capturada:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Container(
            height: 150,
            width: 150,
            color: const Color(0xFF64B5F6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                incident.fotoUrl, // O caminho que você colocou no Mock
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image, color: Colors.white));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Widget content,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFF00796B)),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          const Divider(height: 20, thickness: 1, color: Colors.black12),
          content,
        ],
      ),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87, fontSize: 14),
        children: [
          TextSpan(text: "$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
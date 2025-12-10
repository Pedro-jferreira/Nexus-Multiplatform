import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/responses/gen_models.dart';
import '../../../core/widgets/smart_hero_image.dart';

class SuspectIncidentInfo extends StatelessWidget {
  final SuspectResponse suspect;
  final String location;
  final DateTime incidentTime;
  final String originalImageUrl;
  final String detectedImageUrl;

  const SuspectIncidentInfo({
    super.key,
    required this.suspect,
    required this.location,
    required this.incidentTime,
    required this.originalImageUrl,
    required this.detectedImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final birthFormat = DateFormat('dd/MM/yyyy');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10, // Recurso novo do Flutter (gap).
      children: [
        // 1. Cabeçalho com Imagens
        _buildHeaderImages(context),

        // 2. Seção Dados do Suspeito
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle(context, "Dados do Suspeito"),
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoLine("Nome:", suspect.name),
                    const SizedBox(height: 4),
                    _buildInfoLine("CPF:", suspect.cpf),
                    const SizedBox(height: 4),
                    _buildInfoLine("Nascimento:", birthFormat.format(suspect.birthDate)),
                    const SizedBox(height: 8),
                    const Text(
                      "Descrição:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      suspect.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // 3. Seção Detalhes da Ocorrência
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle(context, "Detalhes da Ocorrência"),
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _buildInfoLine("Local:", location),
                    const SizedBox(height: 4),
                    _buildInfoLine("Data/Hora:", dateFormat.format(incidentTime)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );}
  // Helpers de UI

  Widget _buildHeaderImages(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _imageThumb("Original", originalImageUrl),
        Icon(
          Icons.compare_arrows,
          color: Theme.of(context).colorScheme.primary,
        ),
        _imageThumb("Detectada", detectedImageUrl),
      ],
    );
  }

  Widget _imageThumb(String label, String url) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        SmartHeroImage(imageUrl: url, heroTag: url, width: 250, height: 250),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildInfoLine(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label ",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
      ],
    );
  }
  }
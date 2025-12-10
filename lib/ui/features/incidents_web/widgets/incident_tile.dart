import 'package:Nexus/domain/models/enums/api_enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../core/widgets/smart_hero_image.dart';

class IncidentTile extends StatelessWidget {
  final String name;
  final double similaridade;
  final String? location;
  final DateTime dateTime;
  final IncidentStatus status;
  final String originalImgUrl;
  final String detectImgUrl;
  final String heroTag;
  final void Function()? onPressed;
  const IncidentTile({
    super.key,
    required this.name,
    required this.similaridade,
    this.location,
    required this.dateTime,
    required this.status,
    required this.originalImgUrl,
    required this.detectImgUrl,required this.onPressed, required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final isPending = status == IncidentStatus.ABERTO;
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      color: isPending
          ? Theme.of(context).colorScheme.tertiaryFixed
          : Theme.of(context).colorScheme.surfaceVariant,
      child: SizedBox(
        width: 450,
        height: 420,
        child: Column(
          children: [
            Row(
              children: [
                SmartHeroImage(
                  imageUrl: originalImgUrl,
                  heroTag: 'orig_${originalImgUrl}_$dateTime', // Tag única
                  width: 225,
                  height: 188,
                  backgroundColor: Colors.white, // Para PNGs
                ),
                SmartHeroImage(
                  imageUrl: detectImgUrl,
                  heroTag: 'det_${detectImgUrl}_$dateTime', // Tag única
                  width: 225,
                  height: 188,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            _buildInfoHeaderRow(
                              Icons.person_outline_outlined,
                              name,
                              textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _buildInfoHeaderRow(
                              Symbols.familiar_face_and_zone,
                              'Similaridade: ${similaridade.toStringAsFixed(1)}%',
                              textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: similaridade > 80
                                    ? Colors.red[700]
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        if (isPending)
                          Tooltip(
                            message: "Suspeito não verificado",
                            child: Icon(Symbols.person_alert_rounded, size: 40),
                          ),
                      ],
                    ),
                    Column(
                      spacing: 5,
                      children: [
                        _buildInfoRow(
                          Icons.location_on_outlined,
                          'Local:',
                          location ?? 'Indisponível',
                          textTheme,
                        ),
                        _buildInfoRow(
                          Icons.access_time,
                          'Data:',
                          dateFormat.format(dateTime),
                          textTheme,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FilledButton(onPressed: onPressed, child: Text('Ver mais')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
    TextTheme textTheme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        Icon(icon, size: 16),
        Text(
          "$label",
          style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoHeaderRow(IconData icon, String value, TextStyle? style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        Icon(icon, size: 20, ),
        Text(value, style: style, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

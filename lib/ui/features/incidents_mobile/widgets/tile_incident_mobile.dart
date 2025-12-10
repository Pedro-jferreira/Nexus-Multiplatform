import 'package:flutter/material.dart';

class TileIncident extends StatelessWidget {
  final String name;
  final String foto;
  final String camera;
  final String dataCaptura;
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
    final isHighSimilarity = similaridade > 0.95;
    final backgroundColor = isHighSimilarity
        ? const Color(0xFFE3F2FD)
        : Colors.white;

    const redColor = Color(0xFFE74C3C);
    const blueDateColor = Color(0xFF3498DB);
    final graySubtitleColor = Colors.grey[700];

    return Card(
      color: backgroundColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 64,
                width: 64,
                child: Image.asset(
                  foto,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    camera,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: graySubtitleColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Similaridade: ${(similaridade * 100).toStringAsFixed(0)}%",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: redColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    dataCaptura,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: blueDateColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
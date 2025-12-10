import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/app_router.dart';

class SmartHeroImage extends StatelessWidget {
  final String imageUrl;
  final String heroTag; // Importante para diferenciar animações
  final double width;
  final double height;
  final Color? backgroundColor; // Para PNGs transparentes
  final BorderRadius? borderRadius;
  final Border? border;

  const SmartHeroImage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
    this.width = 100,
    this.height = 100,
    this.backgroundColor,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.zero;
    return InkWell(
      onTap: () {
        ImageViewerRoute(
          imageUrl: imageUrl,
          heroTag: heroTag,
          colorValue: backgroundColor?.value,
        ).push(context);
      },
      child: Hero(
        tag: heroTag,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.grey[200],
              borderRadius: radius,
              border: border,
            ),
            child: ClipRRect(
              borderRadius: radius,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, color: Colors.grey),
                        Text('Erro', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget privado para a exibição em tela cheia com Zoom
class ImageViewerPage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;
  final Color? backgroundColor;

  const ImageViewerPage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Hero(
                tag: heroTag,
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    color: backgroundColor,
                    colorBlendMode: BlendMode.dstOver,
                  ),
                ),
              ),
            ),
          ),
          // Botão de Fechar
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => context.pop(context),
            ),
          ),
        ],
      );
  }
}
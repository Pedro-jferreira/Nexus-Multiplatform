import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.imageUrl,
    required this.iconData,
     this.width = 50,
     this.height = 50,
  });

  final String? imageUrl;
  final IconData iconData;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: height,
      child: ClipOval(
        child: (imageUrl == null)
            ? CircleAvatar(
                radius: 24,
                child: Icon(iconData, size: 28, color: colorScheme.onSurface),
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // terminou de carregar
                  }
                  return CircleAvatar(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.primary,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return CircleAvatar(
                    child: Icon(
                      iconData,
                      size: 28,
                      color: colorScheme.onSurface,
                    ),
                  );
                },
              ),
      ),
    );
  }
}

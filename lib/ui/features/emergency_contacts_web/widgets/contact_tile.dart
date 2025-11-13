import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String contactName;
  final String contactNumber;
  final String contactImgUrl;
  final void Function()? onCallPressed;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const ContactTile({
    super.key,
    required this.contactName,
    required this.contactNumber,
    required this.contactImgUrl,
    required this.onCallPressed,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: Row(
          children: [
            Expanded(flex: 1, child: _buildLending(textTheme, colorScheme)),
            Expanded(
              flex: 1,
              child: _buildInfo(
                textTheme,
                colorScheme,
                'Contato',
                contactNumber,
              ),
            ),
            Expanded(flex: 1, child: _buildActionsButtons(colorScheme)),
          ],
        ),
      ),
    );
  }

  Row _buildLending(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      spacing: 15,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(contactImgUrl),
            onBackgroundImageError: (_, __) {},

            child:contactImgUrl.isEmpty?  Icon(Icons.broken_image):null, // fallback
          ),
        ),
        Expanded(child: _buildInfo(textTheme, colorScheme, 'Nome', contactName)),
      ],
    );
  }

  IntrinsicHeight _buildActionsButtons(ColorScheme colorScheme) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 19,
        children: [
          OutlinedButton.icon(
            onPressed: onCallPressed,
            icon: Icon(Icons.call_outlined, size: 24),
            label: Text('Ligar'),
          ),
          Row(
            spacing: 8,
            children: [
              IconButton(
                onPressed: onEditPressed,
                icon: Icon(Icons.edit_outlined),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  foregroundColor: colorScheme.onSecondary,
                ),
                iconSize: 24,
                tooltip: 'Editar',
              ),
              IconButton(
                onPressed: onDeletePressed,
                icon: Icon(Icons.delete_forever_outlined),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  foregroundColor: colorScheme.onSecondary,
                ),
                tooltip: 'Apagar',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildInfo(
    TextTheme textTheme,
    ColorScheme colorScheme,
    String infoName,
    String info,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          infoName,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SelectableText(
          info,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
          minLines: 1,
          maxLines: 3,
        ),
      ],
    );
  }
}

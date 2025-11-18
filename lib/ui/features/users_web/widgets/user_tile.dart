import 'package:flutter/material.dart';
import 'package:Nexus/guards/roles.dart';

import '../../../core/widgets/custom_circle_avatar.dart';

class UserTile extends StatelessWidget {
  final String nome;
  final String? urlProfile;
  final Role role;
  final String status;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const UserTile({
    super.key,
    required this.nome,
    this.urlProfile,
    required this.role,
    required this.status,
    this.onEditPressed,
    this.onDeletePressed,
  });

  _onCreate(){

  }

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
              child: _buildInfo(textTheme, colorScheme, 'Cargo', role.name),
            ),
            Expanded(
              flex: 1,
              child: _buildInfo(textTheme, colorScheme, 'Status', status),
            ),
            _buildActionsButtons(colorScheme),
          ],
        ),
      ),
    );
  }

  Row _buildLending(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      spacing: 15,
      children: [
        CustomCircleAvatar(imageUrl: urlProfile, iconData: Icons.person_rounded,),
        Expanded(child: _buildInfo(textTheme, colorScheme, 'Nome', nome)),
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



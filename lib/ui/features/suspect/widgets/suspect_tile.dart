import 'package:flutter/material.dart';

class SuspectTile extends StatelessWidget {
  final String nome;
  final String imgUrl;
  final String cpf;
  final String dataNascimento;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  final double imgHeight;
  final double imgWidth;
  const SuspectTile({
    super.key,
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.imgUrl,  this.imgHeight =129,  this.imgWidth = 167,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(children: [
        _buildLending(textTheme, colorScheme),
        _buildInfo(textTheme, colorScheme, 'Documento', cpf),
        _buildInfo(textTheme, colorScheme, 'Nascimento', dataNascimento),
        _buildActionsButtons(colorScheme)
      ]),
    ));
  }

  _buildLending(TextTheme textTheme, ColorScheme colorScheme) {
    return Expanded(
      child: Row(
        spacing: 15,
        children: [
        Image.network(
        imgUrl,
        height:  imgHeight,
        width: imgWidth,
        fit: BoxFit.cover, // Recomendado para a imagem preencher o espaço corretamente

        // 1. Tratamento de Carregamento
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: imgHeight,
            width: imgWidth,
            child: Center(
              child: CircularProgressIndicator(
                // Mostra o progresso se possível, senão fica indeterminado
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },

        // 2. Tratamento de Erro
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: imgHeight,
            width: imgWidth,
            color: colorScheme.surfaceContainerHighest, // Cor de fundo suave
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.broken_image, color: colorScheme.error),
                const SizedBox(height: 4),
                Text(
                  'Erro',
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.error),
                )
              ],
            ),
          );
        },
      ),
          _buildInfo(textTheme, colorScheme, 'Nome', nome),
        ],
      ),
    );
  }

  _buildInfo(
    TextTheme textTheme,
    ColorScheme colorScheme,
    String infoName,
    String info,
  ) {
    return Expanded(
      child: Column(
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
      ),
    );
  }
  _buildActionsButtons(ColorScheme colorScheme) {
    return Row(
      spacing: 8,
      children: [
        IconButton(
          onPressed: onEditPressed,
          icon: Icon(Icons.edit_outlined),
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
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
    );
  }
}

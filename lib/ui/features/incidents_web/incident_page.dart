import 'package:Nexus/ui/features/incidents_web/widgets/find_suspect_modal.dart';
import 'package:Nexus/ui/features/incidents_web/widgets/incident_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../domain/models/enums/api_enums.dart';
import '../../../domain/models/responses/gen_models.dart';
import '../../../routing/routes/web/app_router_web.dart';
import '../../core/layout/custom_app_bar.dart';
class IncidentDetailArgs {
  final int id;
  final SuspectResponse suspect;
  final String location;
  final DateTime incidentTime;
  final String originalImageUrl;
  final String detectedImageUrl;
  final IncidentStatus currentStatus;

  IncidentDetailArgs({
    required this.suspect,
    required this.location,
    required this.incidentTime,
    required this.originalImageUrl,
    required this.detectedImageUrl,
    required this.currentStatus, required this.id,
  });
}

class IncidentPage extends StatefulWidget {
  const IncidentPage({super.key});

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  @override
  Widget build(BuildContext context) {
    final String imgSuspeito =
        "https://apijava-qrcode.s3.us-west-1.amazonaws.com/Imagem%20do%20WhatsApp%20de%202025-12-06%20%C3%A0(s)%2011.33.41_be3e5a8b.jpg_1765140324220";
    final String imgCena =
        "https://apijava-qrcode.s3.us-west-1.amazonaws.com/saiba-como-a-educacao-ajuda-voce-a-ser-uma-pessoa-melhor.jpeg_1765139969958";

    final mockSuspect = SuspectResponse(
      id: 12345,
      name: "Carlos Silva (Vulgo 'Sombra')",
      birthDate: DateTime(1985, 05, 20),
      cpf: "123.456.789-00",
      description: "Cicatriz visível na sobrancelha esquerda. Tatuagem de dragão no antebraço direito. Histórico de invasão em áreas restritas.",
      images: [], // Lista vazia ou com ImageResponse
      suspectStatus: SuspectStatus.FORAGIDO, // Supondo que exista esse enum no seu domínio
    );

// As variáveis usadas no Tile
    final String localOcorrencia = "Portaria Principal - CAM 01";
    final DateTime dataOcorrencia = DateTime.now();
    final IncidentStatus statusAtual = IncidentStatus.POSITIVO;
    return Column(
        spacing: 42,
        children: [
          CustomAppBar(
            title: 'Gerenciamento de Incidentes',
            primaryActionButton: FilledButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return FindSuspectModal();
                  },
                );
              },
              label: Text('Buscar Foragido'),
              icon: Icon(Symbols.familiar_face_and_zone, size: 24),
            ),
            secondaryActionButton: FilledButton.icon(
              onPressed: () {
                /* showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return SuspectEditorModal.create(viewModel: widget.viewModel);
                  },
                );*/
              },
              label: Text('Gerar relatório'),
              icon: Icon(Symbols.file_save, size: 24),
            ),
          ),

          Expanded(
            child: ListenableBuilder(
              listenable: Listenable.merge([
       /*         widget.viewModel,
                widget.viewModel.fetchCmd,
                widget.viewModel.fetchMoreCmd,*/
              ]),
              builder: (context, _) {
              /*  if (widget.viewModel.fetchCmd.value.isRunning) {
                  return Center(child: CircularProgressIndicator());
                }
                if (widget.viewModel.suspects.isEmpty) {
                  return Center(child: Text('Sem Suspeito encontrados'));
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth;
                    const minContentWidth = 700.0;
                    final needsHorizontalScroll = maxWidth < minContentWidth;

                    final listContent = ListView.builder(
                      controller: _scrollController,
                      itemCount:
                      widget.viewModel.suspects.length +
                          (widget.viewModel.fetchMoreCmd.value.isRunning ? 1 : 0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final suspect = widget.viewModel.suspects[index];

                        if (index == widget.viewModel.suspects.length &&
                            widget.viewModel.fetchMoreCmd.value.isRunning) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        return SuspectTile(
                          nome: suspect.name,
                          cpf: suspect.cpf,
                          dataNascimento: DateFormat(
                            'dd/MM/yyyy',
                          ).format(suspect.birthDate),
                          onEditPressed: () {
                            _onEdit(suspect);
                          },
                          onDeletePressed: () {
                            _onDelete(suspect.id);
                          },
                          imgUrl: suspect.images.first.url,
                        );
                      },
                    );

                    if (needsHorizontalScroll) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: minContentWidth,
                          ),
                          child: SizedBox(
                            width: minContentWidth,
                            child: listContent,
                          ),
                        ),
                      );
                    } else {
                      return listContent;
                    }
                  },
                );*/

                return Wrap(
                  spacing: 50,
                  children: [
                    IncidentTile(
                      heroTag: '1',
                      name: "Indivíduo Não Autorizado",
                      similaridade: 98.5, // Alta similaridade
                      location: "Portaria Principal - CAM 01",
                      dateTime: DateTime.now(), // Agora
                      status: IncidentStatus.ABERTO, // Gera a cor de alerta
                      originalImgUrl: imgSuspeito,
                      detectImgUrl: imgCena,
                      onPressed: (){
                        final args = IncidentDetailArgs(
                          id: 1,
                          suspect: mockSuspect, // O objeto completo criado acima
                          location: localOcorrencia,
                          incidentTime: dataOcorrencia,
                          originalImageUrl: imgSuspeito,
                          detectedImageUrl: imgCena,
                          currentStatus: IncidentStatus.ABERTO,
                        );

                        // Navega usando a rota tipada
                        IncidentDetailRoute($extra: args).push(context);
                      },
                    ),
                    IncidentTile(
                      heroTag: '2',
                      name: "Validação de Funcionário",
                      similaridade: 45.2, // Baixa similaridade
                      location: "Refeitório - CAM 05",
                      dateTime: DateTime.now().subtract(const Duration(hours: 2)),
                      status: IncidentStatus.FALSO_POSITIVO, // Cor padrão
                      originalImgUrl: imgSuspeito,
                      detectImgUrl: imgCena,
                      onPressed: (){
                        final args = IncidentDetailArgs(
                          id: 2,
                          suspect: mockSuspect, // O objeto completo criado acima
                          location: localOcorrencia,
                          incidentTime: dataOcorrencia,
                          originalImageUrl: imgSuspeito,
                          detectedImageUrl: imgCena,
                          currentStatus: IncidentStatus.FALSO_POSITIVO,
                        );

                        // Navega usando a rota tipada
                        IncidentDetailRoute($extra: args).push(context);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    }
}

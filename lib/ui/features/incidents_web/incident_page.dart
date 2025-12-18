import 'package:Nexus/ui/features/incidents_web/view_models/incident_view_model.dart';
import 'package:Nexus/ui/features/incidents_web/widgets/find_suspect_modal.dart';
import 'package:Nexus/ui/features/incidents_web/widgets/incident_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

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
  late final IncidentViewModel viewModel;
  @override
  void initState() {
    super.initState();
   viewModel = context.read();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadIncidents();
    });
  }


  @override
  Widget build(BuildContext context) {

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
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.incidents.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (viewModel.isError && viewModel.incidents.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Erro ao carregar incidentes.'),
                        ElevatedButton(
                          onPressed: viewModel.loadIncidents,
                          child: const Text('Tentar novamente'),
                        ),
                      ],
                    ),
                  );
                }

                if (viewModel.incidents.isEmpty) {
                  return const Center(child: Text('Nenhum incidente encontrado.'));
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 50,
                        runSpacing: 50,
                        children: viewModel.incidents.map((incident) {
                          return IncidentTile(
                            heroTag: incident.id.toString(),
                            name: incident.suspect.name ?? "Desconhecido",
                            similaridade: incident.score ?? 0.0,
                            location: incident.location ?? "Local não informado",
                            dateTime: incident.createdAt?? DateTime.now(),
                            status: incident.incidentStatus?? IncidentStatus.ABERTO, // Usa o status que vem do back
                            originalImgUrl: incident.suspect.images.first.url,
                            detectImgUrl: incident.imageUrl??'',
                            onPressed: () {
                              final args = IncidentDetailArgs(
                                id: incident.id,
                                suspect: incident.suspect, // Assume que o Response traz o Suspect
                                location: incident.location ?? "Local não informado",
                                incidentTime: incident.createdAt,
                                originalImageUrl: incident.suspect.images.first.url,
                                detectedImageUrl: incident.imageUrl??'',
                                currentStatus: incident.incidentStatus?? IncidentStatus.ABERTO,
                              );
                              IncidentDetailRoute($extra: args).push(context);
                            },
                          );
                        }).toList(),
                      ),

                      // Botão "Ver Mais" ou Loading no final
                      if (viewModel.hasMore)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: viewModel.isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                            onPressed: viewModel.loadMore,
                            child: const Text('Carregar mais incidentes'),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
}

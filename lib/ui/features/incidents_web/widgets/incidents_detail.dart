
import 'package:Nexus/ui/features/incidents_web/view_models/incident_view_model.dart';
import 'package:Nexus/ui/features/incidents_web/widgets/suspect_incident_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


import '../../../../domain/models/enums/api_enums.dart';
import '../incident_page.dart';

class IncidentDetailPage extends StatefulWidget {
  final IncidentDetailArgs args;

  const IncidentDetailPage({super.key, required this.args});

  @override
  State<IncidentDetailPage> createState() => _IncidentDetailPageState();
}

class _IncidentDetailPageState extends State<IncidentDetailPage> {
  late Set<IncidentStatus> _selectedStatus;
  late final IncidentViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read();

    if (widget.args.currentStatus == IncidentStatus.ABERTO) {
      _selectedStatus = {}; // Nenhuma seleção
    } else {
      _selectedStatus = {widget.args.currentStatus};
    }
  }

  void _updateStatus(Set<IncidentStatus> newSelection) {
    if (newSelection.isEmpty) return;
    final selected = newSelection.first;
    setState(() {
      _selectedStatus = newSelection;
    });

     viewModel.updateIncident(widget.args.id, selected);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 620, maxHeight: 750),
        child: Card(
          elevation: 10,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      tooltip: 'Fechar',
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.close_outlined),
                    ),
                    Text(
                      'Alerta de incidente',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: SuspectIncidentInfo(
                    suspect: widget.args.suspect,
                    location: widget.args.location,
                    incidentTime: widget.args.incidentTime,
                    originalImageUrl: widget.args.originalImageUrl,
                    detectedImageUrl: widget.args.detectedImageUrl,
                  ),
                ),
              ),

              const Divider(height: 1),

              ListenableBuilder(
                listenable: viewModel,
                builder: (context,_) {
                  final bool isThisLoading = viewModel.isLoading;
                  return Stack(
                    children: [
                      Opacity(
                        opacity: isThisLoading ? 0.5 : 1.0, // Efeito de desabilitado
                        child: AbsorbPointer(
                          absorbing: isThisLoading, // Impede cliques enquanto salva
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: SegmentedButton<IncidentStatus>(
                                emptySelectionAllowed: true,
                                segments: const [
                                  ButtonSegment<IncidentStatus>(
                                    value: IncidentStatus.POSITIVO,
                                    label: Text('Positivo'),
                                    icon: Icon(Icons.check_circle_outline),
                                  ),
                                  ButtonSegment<IncidentStatus>(
                                    value: IncidentStatus.FALSO_POSITIVO,
                                    label: Text('Falso Positivo'),
                                    icon: Icon(Icons.cancel_outlined),
                                  ),
                                ],

                                selected: _selectedStatus.contains(IncidentStatus.ABERTO)
                                    ? <IncidentStatus>{}
                                    : _selectedStatus,

                                onSelectionChanged: (Set<IncidentStatus> newSelection) {
                                  if (newSelection.isEmpty) {
                                    return;
                                  }
                                  _updateStatus(newSelection);
                                },

                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                                    states,
                                  ) {
                                    if (states.contains(WidgetState.selected)) {
                                      if (_selectedStatus.contains(
                                        IncidentStatus.POSITIVO,
                                      )) {
                                        return Theme.of(
                                          context,
                                        ).colorScheme.secondary; // Fundo verde suave
                                      }
                                      if (_selectedStatus.contains(
                                        IncidentStatus.FALSO_POSITIVO,
                                      )) {
                                        return Theme.of(
                                          context,
                                        ).colorScheme.tertiary; // Fundo vermelho suave
                                      }
                                    }
                                    return null; // Cor padrão quando não selecionado
                                  }),
                                  foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                                    states,
                                  ) {
                                    if (states.contains(WidgetState.selected)) {
                                      if (_selectedStatus.contains(
                                        IncidentStatus.POSITIVO,
                                      )) {
                                        return Theme.of(context).colorScheme.onSecondary;
                                      }
                                      if (_selectedStatus.contains(
                                        IncidentStatus.FALSO_POSITIVO,
                                      )) {
                                        return Theme.of(context).colorScheme.onTertiary;
                                      }
                                    }
                                    return null;
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isThisLoading)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

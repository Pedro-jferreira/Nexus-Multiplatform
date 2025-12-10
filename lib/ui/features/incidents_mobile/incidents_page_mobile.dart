import 'package:Nexus/ui/features/incidents_mobile/mock/mock_incidents_data.dart';
import 'package:Nexus/ui/features/incidents_mobile/view_model/incidents_mobile_view_model.dart';
import 'package:Nexus/ui/features/incidents_mobile/widgets/tile_incident_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentsPage extends StatefulWidget {
  const IncidentsPage({super.key});

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  late final IncidentsMobileViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _viewModel = IncidentsMobileViewModel(repository: context.read());
    _viewModel.fetchCmd.execute();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_viewModel.fetchMoreCmd.value.isRunning && _viewModel.hasMore) {
        _viewModel.fetchMoreCmd.execute();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        _viewModel,
        _viewModel.fetchCmd,
        _viewModel.fetchMoreCmd
      ]),
      builder: (context, _) {
        if (_viewModel.fetchCmd.value.isRunning) {
          return const Center(child: CircularProgressIndicator());
        }

        final listaDisplay = MockIncidents.incidents;

        if (listaDisplay.isEmpty) {
          return ListView(
            children: [
              _buildHeader(),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Nenhum alerta detectado no momento.\n Novas detecções aparecerão aqui.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 20),
          itemCount: listaDisplay.length + 1,
          itemBuilder: (context, index) {

            if (index == 0) {
              return _buildHeader();
            }
            final incident = listaDisplay[index - 1];

            return TileIncident(
              name: incident.nome,
              foto: incident.fotoUrl,
              camera: incident.camera,
              similaridade: incident.grauSimilaridade,
              dataCaptura: incident.dataCaptura,
            );
          },
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 49, bottom: 49),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.notifications_none_outlined,
            size: 24,
            color: Color(0xFF1D1D1D),
          ),
          const SizedBox(width: 10),
          const Text(
            "Alertas de Similaridade",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1D1D1D),
            ),
          ),
        ],
      ),
    );
  }
}

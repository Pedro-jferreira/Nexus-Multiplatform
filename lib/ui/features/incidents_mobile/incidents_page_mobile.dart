import 'package:Nexus/ui/features/incidents_mobile/view_model/incidents_mobile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routing/routes/mobile/app_router_mobile.dart';

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
    return Column(
      children: [
        ElevatedButton(onPressed: () {
          IncidentsDetailsRouter().go(context);
        }, child: Text("Incidents Details")),
        Expanded(
          child: ListenableBuilder(
            listenable: Listenable.merge([
              _viewModel,
              _viewModel.fetchCmd,
              _viewModel.fetchMoreCmd
            ]),
            builder: (context, _) {
              if(_viewModel.fetchCmd.value.isRunning) return Center(child: CircularProgressIndicator());
              if(_viewModel.suspects.isEmpty) return Center(child: Text('Nenhum aleta detectado no momento.\n Novas detecções aparecerão aqui.'));

              return Placeholder();
            },
          ),
        ),
      ],
    );
  }
}

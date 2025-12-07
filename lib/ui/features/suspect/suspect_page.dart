import 'dart:async';

import 'package:Nexus/ui/features/suspect/view_models/suspect_view_model.dart';
import 'package:Nexus/ui/features/suspect/widgets/delet_suspect_modal.dart';
import 'package:Nexus/ui/features/suspect/widgets/supect_editor_modal.dart';
import 'package:Nexus/ui/features/suspect/widgets/suspect_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/enums/api_enums.dart';
import '../../../domain/models/requests/gen_models.dart';
import '../../../domain/models/responses/gen_models.dart';
import '../../../routing/routes/web/app_router_web.dart';
import '../../core/layout/custom_app_bar.dart';
import '../../core/widgets/custom_dropdown_chip.dart';

class SuspectPage extends StatefulWidget {
  final String? initialCpf;
  const SuspectPage({super.key, this.initialCpf});

  @override
  State<SuspectPage> createState() => _SuspectPageState();
}

class _SuspectPageState extends State<SuspectPage> {
  late final SuspectViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();
  final _searchController = TextEditingController();

  Timer? _debounce;


  @override
  void initState() {
    super.initState();
    _viewModel = context.read<SuspectViewModel>();
    _scrollController.addListener(_onScroll);

    // Executa na primeira criação
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleInitialLoad();
    });
  }

  @override
  void didUpdateWidget(covariant SuspectPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialCpf != oldWidget.initialCpf) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _applyCpfFilter();
      });
    }
  }

  void _applyCpfFilter() {
    if (widget.initialCpf != null && widget.initialCpf!.isNotEmpty) {
      _searchController.text = widget.initialCpf!;
      _viewModel.updateFilter(query: Optional.of(widget.initialCpf),status: Optional.absent());
    }
  }

  void _handleInitialLoad() {
    if (widget.initialCpf != null && widget.initialCpf!.isNotEmpty) {
      _applyCpfFilter();
    }
    else if (_viewModel.suspects.isEmpty && !_viewModel.fetchCmd.value.isRunning) {
      _viewModel.fetchCmd.execute();
    }
  }


  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_viewModel.fetchMoreCmd.value.isRunning && _viewModel.hasMore) {
        _viewModel.fetchMoreCmd.execute();
      }
    }
  }

  _onEdit(SuspectResponse model) {
        showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return SuspectEditorModal.edit(viewModel: _viewModel, model: model);
      },
    );
  }

  _onDelete(id) {
        showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DeleteSuspectModal(viewModel: _viewModel, id: id);
      },
    );
  }
  void debounceQuery(String text) {
    setState(() {});
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (_viewModel.fetchCmd.value.isRunning) {
        _viewModel.fetchCmd.cancel();
      }

      final cleaned = text.trim();
      final query = cleaned.isEmpty ? null : cleaned;

      _viewModel.updateFilter(query: Optional.of(query));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _viewModel.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 42,
      children: [
        CustomAppBar(
          title: 'Gerenciamento de Suspeitos',
          primaryActionButton: FilledButton.icon(
            onPressed: () {
                      showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return SuspectEditorModal.create(viewModel: _viewModel);
                },
              );
            },
            label: Text('Adicionar suspeito'),
            icon: Icon(Icons.person_add_alt_1_outlined, size: 24),
          ),
        ),
        ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            return Row(
              spacing: 20,
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: TextField(
                      onSubmitted: (value) {
                        _viewModel.updateFilter(query: Optional.of(value));
                      },
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Buscar por Suspeito',
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {}); // atualiza ícone
                                  debounceQuery(""); // limpa filtro também
                                  if(widget.initialCpf != null){
                                    const FugitivesRoute().go(context);
                                  }
                                },
                              )
                            : const Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: debounceQuery,
                    ),
                  ),
                ),

                // Botão de abrir filtros
                CustomDropdownChip<SuspectStatus>(
                  items: SuspectStatus.values,
                  selected: _viewModel.filter.status,
                  placeholder: "Selecionar status",
                  labelBuilder: (e) => e.name,
                  onSelected: (value) {
                    _viewModel.updateFilter(status: Optional.of(value));
                  },
                ),
              ],
            );
          },
        ),
        Expanded(
          child: ListenableBuilder(
            listenable: Listenable.merge([
              _viewModel,
              _viewModel.fetchCmd,
              _viewModel.fetchMoreCmd,
            ]),
            builder: (context, _) {
              if (_viewModel.fetchCmd.value.isRunning) {
                return Center(child: CircularProgressIndicator());
              }
              if (_viewModel.suspects.isEmpty) {
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
                        _viewModel.suspects.length +
                        (_viewModel.fetchMoreCmd.value.isRunning ? 1 : 0),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final suspect = _viewModel.suspects[index];

                      if (index == _viewModel.suspects.length &&
                          _viewModel.fetchMoreCmd.value.isRunning) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SuspectTile(
                        nome: suspect.name,
                        cpf: suspect.cpf,
                        dataNascimento: DateFormat('dd/MM/yyyy').format(suspect.birthDate),
                        onEditPressed: _onEdit(suspect),
                        onDeletePressed: _onDelete(suspect.id),
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
              );
            },
          ),
        ),
      ],
    );
  }
}

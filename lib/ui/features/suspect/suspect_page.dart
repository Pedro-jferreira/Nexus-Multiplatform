import 'dart:async';

import 'package:Nexus/ui/features/suspect/view_models/suspect_view_model.dart';
import 'package:Nexus/ui/features/suspect/widgets/delet_suspect_modal.dart';
import 'package:Nexus/ui/features/suspect/widgets/supect_editor_modal.dart';
import 'package:Nexus/ui/features/suspect/widgets/suspect_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/enums/api_enums.dart';
import '../../../domain/models/requests/gen_models.dart';
import '../../../domain/models/responses/gen_models.dart';
import '../../../routing/routes/web/app_router_web.dart';
import '../../core/layout/custom_app_bar.dart';
import '../../core/widgets/custom_dropdown_chip.dart';

class SuspectPage extends StatefulWidget {
  final String? initialCpf;
  final SuspectViewModel viewModel;
  const SuspectPage({super.key, this.initialCpf, required this.viewModel});

  @override
  State<SuspectPage> createState() => _SuspectPageState();
}

class _SuspectPageState extends State<SuspectPage> {
  final ScrollController _scrollController = ScrollController();
  final _searchController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    if (widget.initialCpf != null) {
      _searchController.text = widget.initialCpf!;
    }
    _handlerInit();
  }

  @override
  void didUpdateWidget(SuspectPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialCpf != oldWidget.initialCpf) {
      _handlerInit();
      if (widget.initialCpf != null) {
        _searchController.text = widget.initialCpf!;
        _searchController.selection = TextSelection.fromPosition(
          TextPosition(offset: _searchController.text.length),
        );
      } else {
        _searchController.clear();
      }
    }
  }

  _handlerInit() {
    if (!widget.viewModel.fetchCmd.value.isRunning) {
      if (widget.initialCpf != null) {
        widget.viewModel.updateFilter(query: Optional.of(widget.initialCpf));
      } else {
        widget.viewModel.fetchCmd.execute();
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!widget.viewModel.fetchMoreCmd.value.isRunning &&
          widget.viewModel.hasMore) {
        widget.viewModel.fetchMoreCmd.execute();
      }
    }
  }

  _onEdit(SuspectResponse model) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return SuspectEditorModal.edit(
          viewModel: widget.viewModel,
          model: model,
        );
      },
    );
  }

  _onDelete(id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DeleteSuspectModal(viewModel: widget.viewModel, id: id);
      },
    );
  }

  void debounceQuery(String text) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (widget.viewModel.fetchCmd.value.isRunning) {
        widget.viewModel.fetchCmd.cancel();
      }

      final cleaned = text.trim();
      final query = cleaned.isEmpty ? null : cleaned;

      widget.viewModel.updateFilter(query: Optional.of(query));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
                  return SuspectEditorModal.create(viewModel: widget.viewModel);
                },
              );
            },
            label: Text('Adicionar suspeito'),
            icon: Icon(Icons.person_add_alt_1_outlined, size: 24),
          ),
        ),
        ListenableBuilder(
          listenable: Listenable.merge([
            widget.viewModel,
            widget.viewModel.fetchCmd,
            widget.viewModel.fetchMoreCmd,
          ]),
          builder: (context, _) {
            return Row(
              spacing: 20,
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: TextField(
                      onSubmitted: (value) {
                        widget.viewModel.updateFilter(
                          query: Optional.of(value),
                        );
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
                                  if (widget.initialCpf != null) {
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
                  selected: widget.viewModel.filter.status,
                  placeholder: "Selecionar status",
                  labelBuilder: (e) => e.name,
                  onSelected: (value) {
                    widget.viewModel.updateFilter(status: Optional.of(value));
                  },
                ),
              ],
            );
          },
        ),
        Expanded(
          child: ListenableBuilder(
            listenable: Listenable.merge([
              widget.viewModel,
              widget.viewModel.fetchCmd,
              widget.viewModel.fetchMoreCmd,
            ]),
            builder: (context, _) {
              if (widget.viewModel.fetchCmd.value.isRunning) {
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
              );
            },
          ),
        ),
      ],
    );
  }
}

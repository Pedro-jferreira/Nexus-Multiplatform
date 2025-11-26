import 'dart:async';

import 'package:Nexus/domain/models/enums/api_enums.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:Nexus/ui/features/users_web/view_models/user_view_model.dart';
import 'package:Nexus/ui/features/users_web/widgets/delete_user_modal.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/guards/roles.dart';
import 'package:Nexus/ui/features/users_web/widgets/user_editor_modal.dart';
import 'package:Nexus/ui/features/users_web/widgets/user_tile.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/requests/gen_models.dart';
import '../../core/layout/custom_app_bar.dart';
import '../../core/widgets/custom_dropdown_chip.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final UserViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();
  final _searchController = TextEditingController();

  Timer? _debounce;


  final filters = <String, dynamic>{};

  @override
  void initState() {
    _viewModel = UserViewModel(repository: context.read());
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

  _onEdit(UserResponse model) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return UserEditorModal.edit(viewModel: _viewModel, model: model);
      },
    );
  }

  _onDelete(id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DeleteUserModal(viewModel: _viewModel, id: id);
      },
    );
  }
  void debounceQuery(String text) {
    setState(() {

    });
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
          title: 'Gerenciamento de usuários',
          primaryActionButton: FilledButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return UserEditorModal.create(viewModel: _viewModel);
                },
              );
            },
            label: Text('Adicionar contato'),
            icon: Icon(Icons.person_add_alt_1_outlined, size: 24),
          ),
        ),
        ListenableBuilder(
          listenable: _viewModel,
          builder: (context,_) {
            return Row(
              spacing: 20,
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: TextField(
                      onSubmitted: (value){
                        _viewModel.updateFilter(query: Optional.of(value));
                      },
                      controller:_searchController,
                      decoration: InputDecoration(
                        hintText: 'Buscar por usuário',
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {}); // atualiza ícone
                            debounceQuery(""); // limpa filtro também
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
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 5,
                    children: [
                      CustomDropdownChip<Role>(
                      items: Role.values,
                      selected: _viewModel.filter.role,
                      placeholder: "Selecionar cargo",
                      labelBuilder: (e) => e.name,
                      onSelected: (value) {
                        _viewModel.updateFilter(role: Optional.of(value));
                      },
                    ),
                      CustomDropdownChip<EnumStatus>(
                      items: EnumStatus.values,
                      selected: _viewModel.filter.status,
                      placeholder: "Selecionar status",
                      labelBuilder: (e) => e.name,
                      onSelected: (value) {
                        _viewModel.updateFilter(status: Optional.of(value));
                      },
                    )],
                  ),
                ),
              ],
            );
          }
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
              if (_viewModel.users.isEmpty) {
                return Center(child: Text('Sem Usuários'));
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  const minContentWidth = 700.0;
                  final needsHorizontalScroll = maxWidth < minContentWidth;

                  final listContent = ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        _viewModel.users.length +
                        (_viewModel.fetchMoreCmd.value.isRunning ? 1 : 0),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final user = _viewModel.users[index];

                      if (index == _viewModel.users.length &&
                          _viewModel.fetchMoreCmd.value.isRunning) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return UserTile(
                        nome: user.name,
                        role: user.role,
                        status: user.status.name,
                        urlProfile: user.profileImageUrl,
                        onEditPressed: () => _onEdit(user),
                        onDeletePressed: () => _onDelete(user.id),
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

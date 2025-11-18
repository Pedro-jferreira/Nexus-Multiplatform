import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Nexus/ui/core/layout/custom_app_bar.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/view_models/emergency_contact_view_model.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/widgets/contact_tile.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/widgets/modal_create_contact.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/widgets/modal_delete_contact.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/widgets/modal_update_contact.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/models/responses/gen_models.dart';

class EmergencyContactPage extends StatefulWidget {
  const EmergencyContactPage({super.key});

  @override
  State<EmergencyContactPage> createState() => _EmergencyContactPageState();
}

class _EmergencyContactPageState extends State<EmergencyContactPage> {
  late final EmergencyContactViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _viewModel = EmergencyContactViewModel(repository: context.read());
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

  _onCall(phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await Clipboard.setData(ClipboardData(text: phoneNumber));
        showSimpleNotification(
          Text(
            'O dispositivo não suporta ligações.\nNúmero copiado: $phoneNumber',
          ),
        );
      }
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: phoneNumber));
      showSimpleNotification(
        Text(
          'Não foi possível iniciar a ligação.\nNúmero copiado: $phoneNumber',
        ),
      );
    }
  }

  _onEdit(EmergencyContactResponse model) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return ModalUpdateContact(viewModel: _viewModel, model: model);
      },
    );
  }

  _onDelete(id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return ModalDeleteContact(viewModel: _viewModel, id: id);
      },
    );
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
      spacing: 42,
      children: [
        CustomAppBar(
          title: 'Contatos de emergência',
          primaryActionButton: FilledButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return ModalCratedContact(viewModel: _viewModel);
                },
              );
            },
            label: Text('Adicionar contato'),
            icon: Icon(Icons.person_add_alt_1_outlined, size: 24),
          ),
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
              if (_viewModel.contacts.isEmpty) {
                return Center(child: Text('Sem Contatos'));
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  const minContentWidth = 700.0;
                  final needsHorizontalScroll = maxWidth < minContentWidth;

                  final listContent = ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        _viewModel.contacts.length +
                        (_viewModel.fetchMoreCmd.value.isRunning ? 1 : 0),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = _viewModel.contacts[index];

                      if (index == _viewModel.contacts.length &&
                          _viewModel.fetchMoreCmd.value.isRunning) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      String? imageUrl;
                      if (item.images.isNotEmpty) {
                        imageUrl = item.images.first.url;
                      }

                      return ContactTile(
                        contactName: item.name,
                        contactNumber: item.phone,
                        contactImgUrl: imageUrl,
                        onCallPressed: () => _onCall(item.phone),
                        onEditPressed: () => _onEdit(item),
                        onDeletePressed: () => _onDelete(item.id),
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

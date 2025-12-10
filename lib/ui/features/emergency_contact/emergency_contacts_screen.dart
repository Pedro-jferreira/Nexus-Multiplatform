import 'package:Nexus/ui/features/emergency_contact/widgets/card_emergency_contacts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../emergency_contacts_web/view_models/emergency_contact_view_model.dart';
import '../../../../domain/models/responses/gen_models.dart';

Future<void> _makePhoneCall(String phoneNumber) async {
  final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: cleanNumber,
  );
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    debugPrint('Não foi possível fazer a chamada para $cleanNumber');
  }
}

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final notifier = Provider.of<EmergencyContactViewModel>(context, listen: false);
      notifier.fetchCmd.execute();
    });
    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener() {
    final notifier = Provider.of<EmergencyContactViewModel>(context, listen: false);

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.9) {

      final isFetching = notifier.fetchMoreCmd.value.isRunning;

      if (notifier.hasMore && !isFetching) {
        notifier.fetchMoreCmd.execute();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<EmergencyContactViewModel>();

    final isLoading = notifier.fetchCmd.value.isRunning || notifier.fetchMoreCmd.value.isRunning;
    final contacts = notifier.contacts;


    if (notifier.fetchCmd.lastResult.value?.isFailure == true && contacts.isEmpty) {
      final error = notifier.fetchCmd.lastResult.value!.exceptionOrNull;
      return Center(
        child: Text('Erro ao carregar: ${error.toString()}'),
      );
    }

    if (isLoading && contacts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Contatos de Emergência')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,

              itemCount: contacts.length + (notifier.hasMore && isLoading ? 1 : 0),
              itemBuilder: (context, index) {

                if (index == contacts.length && notifier.hasMore && isLoading) {
                  return const Center(child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ));
                }

                final EmergencyContactResponse contact = contacts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: EmergencyCard(
                    contact: contact,
                    onCall: () {
                      _makePhoneCall(contact.phone);
                    },
                  ),
                );
              },
            ),
          ),
          if (isLoading && contacts.isNotEmpty && notifier.hasMore)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),

          if (!notifier.hasMore && contacts.isNotEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Todos os contatos foram carregados.'),
            ),
        ],
      ),
    );
  }
}
// emergency_contacts_screen.dart
import 'package:Nexus/ui/features/emergency_contact/view_model/emergency_view_model.dart';
import 'package:Nexus/ui/features/emergency_contact/widgets/card_emergency_contacts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/repositories/impl/emergency_contact_repository_impl.dart';

Future<void> _makePhoneCall(String phone) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phone,
  );
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    print('Não foi possível fazer a chamada para $phone');
  }
}


class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmergencyContactsNotifier(
        repository: EmergencyContactsRepositoryImpl(service: context.read()),
      )..fetchContacts(),

      child: Scaffold(
        body: Consumer<EmergencyContactsNotifier>(
          builder: (context, notifier, child) {
            final state = notifier.state;

            if (state.errorMessage != null && state.contacts.isEmpty) {
              return Center(child: Text(state.errorMessage!));
            }

            if (state.isLoading && state.contacts.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                      child: Text(
                        'Contatos de Emergência',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length + (state.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      // Loading no final da lista (Paginação)
                      if (index == state.contacts.length) {
                        return const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ));
                      }

                      final contact = state.contacts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: EmergencyCard(
                          contact: contact,
                          onCall: () => _makePhoneCall(contact.phone),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../domain/models/responses/gen_models.dart';

class EmergencyCard extends StatelessWidget {
  final EmergencyContactResponse contact;
  final VoidCallback onCall;

  const EmergencyCard({super.key, required this.contact, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(blurRadius: 6, offset: const Offset(0, 3))],
      ),
      child: Row(
        spacing: 12,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(contact.images as String),
            backgroundColor: Colors.grey.shade200,
          ),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(contact.name.toUpperCase()), Text(contact.phone)],
            ),
          ),
          OutlinedButton.icon(
            onPressed: onCall,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            icon: const Icon(Icons.phone, size: 18, color: Colors.red),
            label: const Text("Ligar",),
            ),
        ],
      ),
    );
  }
}

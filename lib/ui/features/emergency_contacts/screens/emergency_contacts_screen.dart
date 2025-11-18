import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewmodel/emergency_contacts_viewmodel.dart';
import '../widgets/tile_emergency_contact.dart';

class EmergencyContactsScreen extends StatefulWidget{
  const EmergencyContactsScreen({super.key, required this.viewModel, required this.tiles});

  final EmergencyContactsViewModel viewModel;
  final TileEmergencyContact tiles;

  @override
  State<EmergencyContactsScreen> createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: widget.viewModel.emergencies.length,
            itemBuilder: (_, index) => widget.tiles
          )
        ],
      )),
    );
  }
}
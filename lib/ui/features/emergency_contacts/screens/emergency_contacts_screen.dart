import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewmodel/emergency_contacts_viewmodel.dart';

class EmergencyContactsScreen extends StatelessWidget{
  const EmergencyContactsScreen({super.key, required this.viewModel});

  final EmergencyContactsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: viewModel.emergencies.length,
            itemBuilder: (_, index) => ,
          )
        ],
      )),
    );
  }

}
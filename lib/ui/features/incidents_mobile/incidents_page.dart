import 'package:flutter/material.dart';

import '../../../routing/routes/mobile/app_router_mobile.dart';

class IncidentsPage extends StatefulWidget {
  const IncidentsPage({super.key});

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {
          IncidentsDetailsRouter().go(context);
        }, child: Text("Incidents Details"))
      ],
    );
  }
}

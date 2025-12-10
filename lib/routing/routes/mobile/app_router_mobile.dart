import 'package:Nexus/routing/app_router.dart';
import 'package:Nexus/ui/features/emergency_contact/emergency_contacts_screen.dart';
import 'package:Nexus/ui/features/incidents_mobile/pages/IncidentsDetailsPage.dart';
import 'package:Nexus/ui/features/incidents_mobile/pages/incidents_page_mobile.dart';
import 'package:Nexus/ui/features/shell_mobile/shell_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/emergency_contact_repository.dart';
import '../../../ui/features/emergency_contacts_web/view_models/emergency_contact_view_model.dart';
import '../../../ui/features/incidents_mobile/mock/mock_incident_model.dart';
import '../../app_routes.dart';

part 'app_router_mobile.g.dart';

part 'routes/incidents_routes.dart';
part 'routes/contacts_routes.dart';
part 'routes/shell_routes.dart';
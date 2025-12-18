import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/ui/core/layout/custom_app_bar.dart';
import 'package:Nexus/ui/features/auth/reset_password/reset_password_page.dart';
import 'package:Nexus/ui/features/incidents_web/incident_page.dart';
import 'package:Nexus/ui/features/profile_web/profile_page.dart';
import 'package:Nexus/ui/features/suspect/suspect_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Nexus/ui/features/emergency_contacts_web/emergency_contact_page.dart';
import 'package:Nexus/ui/features/shell_web/shell_app.dart';
import 'package:Nexus/ui/features/users_web/user_page.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

import '../../../ui/core/animations/transitions.dart';
import '../../../ui/features/incidents_web/widgets/incidents_detail.dart';
import '../../../ui/features/suspect/view_models/suspect_view_model.dart';
import '../../app_router.dart';
import '../../app_routes.dart';

part 'app_router_web.g.dart';

part 'routes/placeholder.dart';
part 'routes/shell_route.dart';
part 'routes/dashboard_route.dart';
part 'routes/fugitives_route.dart';
part 'routes/users_route.dart';
part 'routes/incidents_route.dart';
part 'routes/contacts_route.dart';
part 'routes/profile_route.dart';
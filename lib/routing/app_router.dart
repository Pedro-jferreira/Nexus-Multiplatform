
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

part 'routes/placeholder_router.dart';

part 'app_router.g.dart';

GoRouter createRouter() =>
    GoRouter(
        initialLocation: PlaceholderRouter().location,
        routes: $appRoutes
    );

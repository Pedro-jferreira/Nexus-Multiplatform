
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_multiplatform/data/repositories/auth_repository.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/login_page.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/viewmodel/login_view_model.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/widgets/presentation_login.dart';
import 'package:provider/provider.dart';

import '../ui/features/auth/forgout_password/forgot_password.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

part 'routes/auth/login_route.dart';
part 'routes/placeholder_router.dart';

GoRouter createRouter(AuthRepository authRepository) =>
    GoRouter(
        refreshListenable: authRepository,
        initialLocation: LoginRoute().location,
        routes: $appRoutes,
        redirect: (BuildContext context, GoRouterState state) {
            final isLoggedIn = authRepository.currentUser != null;
            final isLoggingIn = state.uri.toString().startsWith(LoginRoute().location);

            if (!isLoggedIn && !isLoggingIn) {
                return LoginRoute().location;
            }

            if (isLoggedIn && isLoggingIn) {
                return '/';
            }
            return null;
        },
    );

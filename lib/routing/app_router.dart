import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth_repository.dart';
import '../ui/features/auth/forgout_password/forgot_password.dart';
import '../ui/features/auth/login/login_page.dart';
import '../ui/features/auth/login/viewmodel/login_view_model.dart';
import 'app_routes.dart';
import 'routes/mobile/app_router_mobile.dart' as mobile;
import 'routes/web/app_router_web.dart' as web;

part 'app_router.g.dart';

part 'routes/auth/login_route.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthRepository authRepository) => GoRouter(
  navigatorKey: rootNavigatorKey,
  refreshListenable: authRepository,
  initialLocation: LoginRoute().location,
  routes: [
    ...$appRoutes,
    if (kIsWeb) ...web.$appRoutes else ...mobile.$appRoutes,
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final isLoggedIn = authRepository.currentUser != null;
    final isLoggingIn = state.uri.toString().startsWith(LoginRoute().location);
    if(authRepository.isTemporaryPassword){
      if (kIsWeb) {
        return web.ResetPasswordRoute().location;
      } else {
        return ForgotPasswordRouter().location;
                    // chamar rota alterar senha que está no profile, colocar um snackbar para
                    // avisar que só sairá desta tela se trocar senha (isTemporaryPassword == false)
      }
    }

    if (!isLoggedIn && !isLoggingIn) {
      return LoginRoute().location;
    }

    if (isLoggedIn && isLoggingIn) {
      if (kIsWeb) {
        return web.DashboardRoute().location;
      } else {
        return mobile.IncidentsRouter().location;
      }
    }
    return null;
  },
);

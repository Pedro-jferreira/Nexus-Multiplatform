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

final GlobalKey<NavigatorState> rootMobileNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthRepository authRepository) => GoRouter(
  navigatorKey: !kIsWeb ? rootMobileNavigatorKey : null,
  refreshListenable: authRepository,
  initialLocation: LoginRoute().location,
  routes: [
    ...$appRoutes,
    if (kIsWeb) ...web.$appRoutes else ...mobile.$appRoutes,
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final isLoggedIn = authRepository.currentUser != null;
    final isLoggingIn = state.uri.toString().startsWith(LoginRoute().location);
    if(authRepository.isTemporaryPassword == true){
      if (kIsWeb) {
        return web.ProfileRoute().location;
      } else {
        return '/';
      }
    }

    if (!isLoggedIn && !isLoggingIn) {
      return LoginRoute().location;
    }

    if (isLoggedIn && isLoggingIn) {
      if (kIsWeb) {
        return web.DashboardRoute().location;
      } else {
        // retornar para tela principal (mobile)
        // pensar em uma forma onde, caso a senha logada seja temporária
        // entrar na tela de perfil temporário, caso não, entrar na tela principal
        // do mobile.
        // ATENÇÃO: meu viewmodel terá que ser global.
        return '/';
      }
    }
    return null;
  },
);

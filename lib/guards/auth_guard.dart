import 'package:Nexus/guards/roles.dart';

import '../routing/app_routes.dart';

bool isPublicRoute(String route) {
  return AppRoutes.publicRoutes.contains(route);
}

bool canAccess(
    String route,
    List<Role> userRoles, {
      bool isLoggedIn = false,
    }) {
  if (isPublicRoute(route)) return true;
  if (!isLoggedIn) return false;

  final allowedRoles = AppRoutes.permissions[route] ?? [];
  return userRoles.any((role) => allowedRoles.contains(role));
}

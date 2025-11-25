part of '../app_router_mobile.dart';

const incidentsBranches = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[incidentsDetailsRouter],
);

const incidentRoutes = TypedGoRoute<IncidentsRouter>(
  path: AppRoutes.incidents,
  routes: [incidentsDetailsRouter],
);

class IncidentsRouter extends GoRouteData with _$IncidentsRouter {
  const IncidentsRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Placeholder();
  }
}

const incidentsDetailsRouter = TypedGoRoute<IncidentsDetailsRouter>(
  path: AppRoutes.incidents,
);

class IncidentsDetailsRouter extends GoRouteData with _$IncidentsDetailsRouter {
  const IncidentsDetailsRouter();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootMobileNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Placeholder();
  }
}

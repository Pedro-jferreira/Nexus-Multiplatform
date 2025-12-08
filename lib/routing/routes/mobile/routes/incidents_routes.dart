part of '../app_router_mobile.dart';

const incidentsBranches = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[incidentRoutes],
);

const incidentRoutes = TypedGoRoute<IncidentsRouter>(
  path: AppRoutes.incidents,
  routes: [incidentsDetailsRouter],
);

class IncidentsRouter extends GoRouteData with _$IncidentsRouter {
  const IncidentsRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return IncidentsPage();
  }
}

const incidentsDetailsRouter = TypedGoRoute<IncidentsDetailsRouter>(
  path: AppRoutes.incidentsDetails,
);

class IncidentsDetailsRouter extends GoRouteData with _$IncidentsDetailsRouter {
  const IncidentsDetailsRouter();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(),
      body: Placeholder(color: Colors.yellow),
    );
  }
}

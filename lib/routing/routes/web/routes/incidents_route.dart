part of '../app_router_web.dart';


const incidentsBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    incidentsRoute,
  ],
);

const incidentsRoute  = TypedGoRoute<IncidentsRoute>(path: AppRoutes.incidents);


class IncidentsRoute extends GoRouteData with _$IncidentsRoute{
  const IncidentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return IncidentPage();
  }
}

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
  final IncidentModel $extra;

  const IncidentsDetailsRouter(this.$extra);

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEBEBEB),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.assignment_outlined, color: Colors.black87, size: 20),
            const SizedBox(width: 8),
            const Text(
              "Detalhes do Alerta",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: IncidentsDetailsPage(incident: $extra),
    );
  }
}

part of '../app_router_web.dart';

const incidentsBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[incidentsRoute],
);

const incidentsRoute = TypedGoRoute<IncidentsRoute>(
  path: AppRoutes.incidents,
  routes: [incidentsDetailRoute],
);

class IncidentsRoute extends GoRouteData with _$IncidentsRoute {
  const IncidentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return IncidentPage();
  }
}

const incidentsDetailRoute = TypedGoRoute<IncidentDetailRoute>(
  path: 'incident-detail',
);

class IncidentDetailRoute extends GoRouteData with _$IncidentDetailRoute {
  final IncidentDetailArgs $extra;

  const IncidentDetailRoute({required this.$extra});
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      opaque: false,
      barrierColor: Colors.black87.withValues(alpha: 0.7),
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      child: IncidentDetailPage(args: $extra),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Animação de entrada (Fade + leve escala para parecer um popup)
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

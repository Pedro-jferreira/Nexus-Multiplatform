part of '../app_router_web.dart';

const dashBoardBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
routes: <TypedRoute<RouteData>>[
  dashBoardRoute,
],
);

const dashBoardRoute  = TypedGoRoute<DashboardRoute>(path: AppRoutes.dashBoard);


class DashboardRoute extends GoRouteData with _$DashboardRoute{
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Placeholder();
  }
}

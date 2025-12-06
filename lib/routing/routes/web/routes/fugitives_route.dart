part of '../app_router_web.dart';

const fugitivesBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    fugitivesRoute,
  ],
);

const fugitivesRoute  = TypedGoRoute<FugitivesRoute>(path: AppRoutes.fugitives);


class FugitivesRoute extends GoRouteData with _$FugitivesRoute{
  const FugitivesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SuspectPage();
  }
}

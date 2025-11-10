part of '../app_router_web.dart';


const profileBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    profileRoute,
  ],
);

const profileRoute  = TypedGoRoute<ProfileRoute>(path: AppRoutes.profile);


class ProfileRoute extends GoRouteData with _$ProfileRoute{
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Placeholder();
  }
}

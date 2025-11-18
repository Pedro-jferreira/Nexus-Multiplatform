part of '../app_router_web.dart';


const usersBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    usersRoute,
  ],
);

const usersRoute  = TypedGoRoute<UsersRoute>(path: AppRoutes.users);


class UsersRoute extends GoRouteData with _$UsersRoute{
  const UsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserPage();
  }
}

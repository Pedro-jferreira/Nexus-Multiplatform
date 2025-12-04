part of '../app_router_web.dart';


const profileBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    profileRoute,
  ],
);

const profileRoute  = TypedGoRoute<ProfileRoute>(path: AppRoutes.profile, routes: [resetPasswordRoute]);


class ProfileRoute extends GoRouteData with _$ProfileRoute{
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage();
  }
}

const resetPasswordRoute  = TypedGoRoute<ResetPasswordRoute>(path: AppRoutes.resetPassword);


class ResetPasswordRoute extends GoRouteData with _$ResetPasswordRoute{
  const ResetPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResetPasswordPage();
  }
}

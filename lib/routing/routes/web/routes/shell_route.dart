part of '../app_router_web.dart';


@TypedStatefulShellRoute<ShellAppRouter>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    dashBoardBranch,
    fugitivesBranch,
    usersBranch,
    chatBranch,
    incidentsBranch,
    emergencyContactsBranch,
    profileBranch
  ],
)
class ShellAppRouter extends StatefulShellRouteData {
  const ShellAppRouter();

  @override
  Widget builder(
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
      ) {
    return ShellApp(child: navigationShell);
  }
}

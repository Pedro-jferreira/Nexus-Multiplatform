part of '../app_router_mobile.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedStatefulShellRoute<ShellRoutes>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    incidentsBranch,
    chatBranch,
    contactsBranches
  ],
)

class ShellRoutes extends StatefulShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return ShellAppMobile(child: navigationShell);
  }
}
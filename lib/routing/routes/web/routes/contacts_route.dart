part of '../app_router_web.dart';


const emergencyContactsBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    emergencyContactsRoute,
  ],
);

const emergencyContactsRoute  = TypedGoRoute<EmergencyContactsRoute>(path: AppRoutes.emergencyContacts);


class EmergencyContactsRoute extends GoRouteData with _$EmergencyContactsRoute{
  const EmergencyContactsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EmergencyContactPage();
  }
}

part of '../app_router_mobile.dart';

const contactsBranches = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    contactsRoutes,
  ],
);

const contactsRoutes = TypedGoRoute<ContactsRouter>(path: AppRoutes.emergencyContacts);

class ContactsRouter extends GoRouteData with _$ContactsRouter {
  const ContactsRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Placeholder();
  }
}
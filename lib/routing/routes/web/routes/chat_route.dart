part of '../app_router_web.dart';


const chatBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    chatRoute,
  ],
);

const chatRoute  = TypedGoRoute<ChatRoute>(path: AppRoutes.chat);


class ChatRoute extends GoRouteData with _$ChatRoute{
  const ChatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Placeholder();
  }
}

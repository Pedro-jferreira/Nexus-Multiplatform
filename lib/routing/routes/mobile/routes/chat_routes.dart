part of '../app_router_mobile.dart';

const chatBranches = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    chatRouter,
  ],
);

const chatRouter = TypedGoRoute<ChatRouter>(path: AppRoutes.chat);

class ChatRouter extends GoRouteData with _$ChatRouter {
  const ChatRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Placeholder(color: Colors.red,);
  }
}
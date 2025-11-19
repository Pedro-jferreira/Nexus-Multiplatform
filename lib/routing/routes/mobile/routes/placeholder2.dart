part of '../app_router_mobile.dart';

@TypedGoRoute<Placeholder2Router>(path: AppRoutes.placeholder2)
class Placeholder2Router extends GoRouteData with _$Placeholder2Router {
  const Placeholder2Router();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(color: Colors.yellow,);
  }
}
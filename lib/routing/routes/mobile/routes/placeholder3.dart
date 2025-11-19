part of '../app_router_mobile.dart';

@TypedGoRoute<Placeholder3Router>(path: AppRoutes.placeholder3)
class Placeholder3Router extends GoRouteData with _$Placeholder3Router {
  const Placeholder3Router();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(color: Colors.orange,);
  }
}
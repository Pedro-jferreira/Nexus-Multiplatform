part of '../app_router_mobile.dart';

@TypedGoRoute<Placeholder1Router>(path: AppRoutes.placeholder1)
class Placeholder1Router extends GoRouteData with _$Placeholder1Router {
  const Placeholder1Router();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(color: Colors.white,);
  }
}
part of '../app_router.dart';


@TypedGoRoute<PlaceholderRouter>(path: AppRoutes.placeholder)
class PlaceholderRouter extends GoRouteData with _$PlaceholderRouter {
  const PlaceholderRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}
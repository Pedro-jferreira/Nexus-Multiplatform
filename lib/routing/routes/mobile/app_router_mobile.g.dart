// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router_mobile.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$placeholderRouter];

RouteBase get $placeholderRouter =>
    GoRouteData.$route(path: '/', factory: _$PlaceholderRouter._fromState);

mixin _$PlaceholderRouter on GoRouteData {
  static PlaceholderRouter _fromState(GoRouterState state) =>
      const PlaceholderRouter();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

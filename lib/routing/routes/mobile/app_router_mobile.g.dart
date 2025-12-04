// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router_mobile.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$shellRoutes];

RouteBase get $shellRoutes => StatefulShellRouteData.$route(
  factory: $ShellRoutesExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/incidents',

          factory: _$IncidentsRouter._fromState,
          routes: [
            GoRouteData.$route(
              path: 'incidents_details',

              parentNavigatorKey: IncidentsDetailsRouter.$parentNavigatorKey,

              factory: _$IncidentsDetailsRouter._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/contacts',

          factory: _$ContactsRouter._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellRoutesExtension on ShellRoutes {
  static ShellRoutes _fromState(GoRouterState state) => ShellRoutes();
}

mixin _$IncidentsRouter on GoRouteData {
  static IncidentsRouter _fromState(GoRouterState state) =>
      const IncidentsRouter();

  @override
  String get location => GoRouteData.$location('/incidents');

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

mixin _$IncidentsDetailsRouter on GoRouteData {
  static IncidentsDetailsRouter _fromState(GoRouterState state) =>
      const IncidentsDetailsRouter();

  @override
  String get location => GoRouteData.$location('/incidents/incidents_details');

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

mixin _$ContactsRouter on GoRouteData {
  static ContactsRouter _fromState(GoRouterState state) =>
      const ContactsRouter();

  @override
  String get location => GoRouteData.$location('/contacts');

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

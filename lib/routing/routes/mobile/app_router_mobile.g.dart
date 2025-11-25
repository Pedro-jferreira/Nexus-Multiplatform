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

          factory: _$IncidentsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/chat', factory: _$ChatRoute._fromState),
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

mixin _$IncidentsRoute on GoRouteData {
  static IncidentsRoute _fromState(GoRouterState state) =>
      const IncidentsRoute();

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

mixin _$ChatRoute on GoRouteData {
  static ChatRoute _fromState(GoRouterState state) => const ChatRoute();

  @override
  String get location => GoRouteData.$location('/chat');

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

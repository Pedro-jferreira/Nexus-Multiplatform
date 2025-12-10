// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$loginRoute, $imageViewerRoute];

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/auth/login',

  factory: _$LoginRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'resend',

      factory: _$ForgotPasswordRouter._fromState,
    ),
  ],
);

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/auth/login');

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

mixin _$ForgotPasswordRouter on GoRouteData {
  static ForgotPasswordRouter _fromState(GoRouterState state) =>
      const ForgotPasswordRouter();

  @override
  String get location => GoRouteData.$location('/auth/login/resend');

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

RouteBase get $imageViewerRoute => GoRouteData.$route(
  path: '/image-viewer',

  factory: _$ImageViewerRoute._fromState,
);

mixin _$ImageViewerRoute on GoRouteData {
  static ImageViewerRoute _fromState(GoRouterState state) => ImageViewerRoute(
    imageUrl: state.uri.queryParameters['image-url']!,
    heroTag: state.uri.queryParameters['hero-tag']!,
    colorValue: _$convertMapValue(
      'color-value',
      state.uri.queryParameters,
      int.tryParse,
    ),
  );

  ImageViewerRoute get _self => this as ImageViewerRoute;

  @override
  String get location => GoRouteData.$location(
    '/image-viewer',
    queryParams: {
      'image-url': _self.imageUrl,
      'hero-tag': _self.heroTag,
      if (_self.colorValue != null) 'color-value': _self.colorValue!.toString(),
    },
  );

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

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

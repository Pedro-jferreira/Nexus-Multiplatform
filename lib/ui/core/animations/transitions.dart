import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin FadePageMixin on GoRouteData {
  CustomTransitionPage buildFadePage(
      BuildContext context,
      GoRouterState state,
      Widget child,
      ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(seconds: 3),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

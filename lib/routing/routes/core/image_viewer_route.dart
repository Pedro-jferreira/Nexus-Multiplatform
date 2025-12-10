part of '../../app_router.dart';

@TypedGoRoute<ImageViewerRoute>(
  path: '/image-viewer',
)
class ImageViewerRoute extends GoRouteData with _$ImageViewerRoute {
  final String imageUrl;
  final String heroTag;
  final int? colorValue; // Passaremos a cor como int (ex: 0xFFFFFFFF)

  const ImageViewerRoute({
    required this.imageUrl,
    required this.heroTag,
    this.colorValue,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      opaque: false,
      barrierColor: Colors.black87.withValues(alpha: 0.7),
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 400),
      child: ImageViewerPage(
        imageUrl: imageUrl,
        heroTag: heroTag,
        backgroundColor: colorValue != null ? Color(colorValue!) : null,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
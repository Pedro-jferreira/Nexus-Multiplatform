part of '../app_router_web.dart';


@TypedStatefulShellRoute<ShellAppRouter>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    dashBoardBranch,
    fugitivesBranch,
    usersBranch,
    incidentsBranch,
    emergencyContactsBranch,
    profileBranch
  ],
)
class ShellAppRouter extends StatefulShellRouteData {
  const ShellAppRouter();

  @override
  Widget builder(
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
      ) {
    return ShellApp(child: navigationShell);
  }
  static Widget $navigatorContainerBuilder(
      BuildContext context,
      StatefulNavigationShell navigationShell,
      List<Widget> children,
      ) {
    return NavigatorContainer(
      navigationShell: navigationShell,
      children: children, // Passamos a lista para o nosso Widget
    );
  }
}

class NavigatorContainer extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const NavigatorContainer({
    super.key,
    required this.navigationShell,
    required this.children
  });

  @override
  State<NavigatorContainer> createState() => _NavigatorContainerState();
}

class _NavigatorContainerState extends State<NavigatorContainer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Inicializa o controller na página correta (caso dê refresh na página 3, por exemplo)
    _pageController = PageController(initialPage: widget.navigationShell.currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  void didUpdateWidget(NavigatorContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    final int shellIndex = widget.navigationShell.currentIndex;
    final int pageViewIndex = _pageController.page?.round() ?? 0;

    if (shellIndex == pageViewIndex) return;

    final int distance = (shellIndex - pageViewIndex).abs();
    if (distance > 1) {
      _pageController.jumpToPage(shellIndex);
    } else {
      _pageController.animateToPage(
        shellIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int index) {
    if (widget.navigationShell.currentIndex != index) {
      widget.navigationShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.children,
    );
  }
}
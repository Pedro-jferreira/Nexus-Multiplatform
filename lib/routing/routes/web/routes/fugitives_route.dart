part of '../app_router_web.dart';

const fugitivesBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    fugitivesRoute,
  ],
);

const fugitivesRoute  = TypedGoRoute<FugitivesRoute>(path: AppRoutes.fugitives);


class FugitivesRoute extends GoRouteData with _$FugitivesRoute{
  final String? cpf;

  const FugitivesRoute({this.cpf});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final vm = context.read<SuspectViewModel>();
    return SuspectPage(initialCpf: cpf, viewModel: vm,);
  }
}

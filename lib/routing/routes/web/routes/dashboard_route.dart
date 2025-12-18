part of '../app_router_web.dart';

const dashBoardBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[dashBoardRoute],
);

const dashBoardRoute = TypedGoRoute<DashboardRoute>(path: AppRoutes.dashBoard);

class DashboardRoute extends GoRouteData with _$DashboardRoute {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Column(
      spacing: 47,
      children: [
        CustomAppBar(title: 'Home'),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 30,
          runSpacing: 30,
          children: [_buildCard(Icons.person_search_outlined, 'Foragidos', () {
            FugitivesRoute().go(context);
          }, context),_buildCard(Icons.groups_outlined, 'Usuários', () {
            UsersRoute().go(context);
          }, context),_buildCard(Symbols.release_alert, 'Incidentes', () {
            IncidentsRoute().go(context);
          }, context),],
        ),
      ],
    );
  }

  _buildCard(icon, label, onTap, context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 283,
          height: 187,
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  icon,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(label, style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
      ),
    );
  }
}

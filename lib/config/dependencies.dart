import 'package:Nexus/data/repositories/impl/suspect_repository_impl.dart';
import 'package:Nexus/data/repositories/impl/user_repository_impl.dart';
import 'package:Nexus/data/repositories/incident_repository.dart';
import 'package:Nexus/data/repositories/suspects_repository.dart';
import 'package:Nexus/data/repositories/user_repository.dart';
import 'package:Nexus/data/services/impl/suspect_service_impl.dart';
import 'package:Nexus/data/services/incidents_service.dart';
import 'package:Nexus/data/services/suspect_service.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:Nexus/data/repositories/emergency_contact_repository.dart';
import 'package:Nexus/data/repositories/impl/auth_repository_impl.dart';
import 'package:Nexus/data/repositories/impl/emergency_contact_repository_impl.dart';
import 'package:Nexus/data/services/auth_service.dart';
import 'package:Nexus/data/services/emergency_contacts_service.dart';
import 'package:Nexus/data/services/impl/auth_service_impl.dart';
import 'package:Nexus/data/services/impl/emergency_contacts_impl.dart';
import 'package:Nexus/data/services/impl/users_service_impl.dart';
import 'package:Nexus/data/services/users_service.dart';
import 'package:Nexus/routing/app_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/impl/incidents_repository_impl.dart';
import '../data/repositories/impl/theme_control_repository_impl.dart';
import '../data/repositories/theme_control_repository.dart';
import '../data/services/impl/incidents_service_impl.dart';
import '../ui/features/profile_web/view_model/theme_control_view_model.dart';
import '../ui/features/suspect/view_models/suspect_view_model.dart';
import 'dio_config.dart';

List<SingleChildWidget> providers(SharedPreferences prefs, Dio dio) {
  return [
    ..._initialization(prefs, dio),
    ..._servicesData,
    ..._repositoriesData,
    ..._viewModelsProviders,
  ];
}

//services
List<SingleChildWidget> _initialization(prefs, dio) {
  return [
    Provider<SharedPreferences>.value(value: prefs),
    Provider<Dio>.value(value: dio),

    Provider<AuthService>(
      create: (context) => AuthServiceImpl(dio: context.read()),
    ),
    Provider<UsersServices>(
      create: (context) => UsersServiceImpl(dio: context.read()),
    ),

    ChangeNotifierProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(
        authService: context.read(),
        prefs: context.read(),
      ),
    ),

    Provider<GoRouter>(
      create: (context) => createRouter(context.read<AuthRepository>()),
    ),

    ProxyProvider<GoRouter, Dio>(
      update: (context, router, dioInstance) {
        dioInstance ??= context.read<Dio>();
        DioConfig.attachInterceptors(
          dio: dioInstance,
          router: router,
          authRepository: context.read<AuthRepository>(),
        );
        return dioInstance;
      },
    ),
  ];
}

List<SingleChildWidget> get _servicesData {
  return [
    Provider<EmergencyContactsService>(
      create: (context) => EmergencyContactsServiceImpl(dio: context.read()),
    ),
    Provider<UsersServices>(
      create: (context) => UsersServiceImpl(dio: context.read()),
    ),
    Provider<SuspectsService>(
      create: (context) => SuspectsServiceImpl(dio: context.read()),
    ),
    Provider<IncidentsService>(
      create: (context) => IncidentsServiceImpl(dio: context.read()),
    ),
  ];
}

// repositories
List<SingleChildWidget> get _repositoriesData {
  return [
    Provider<EmergencyContactsRepository>(
      create: (context) =>
          EmergencyContactsRepositoryImpl(service: context.read()),
    ),
    Provider<UserRepository>(
      create: (context) =>
          UserRepositoryImpl(service: context.read()),
    ),
    Provider<SuspectsRepository>(
      create: (context) =>
          SuspectsRepositoryImpl(service: context.read()),
    ),
    Provider<ThemeControlRepository>(
      create: (context) =>
          ThemeControlRepositoryImpl(prefs: context.read()),
    ),
    Provider<IncidentRepository>(
      create: (context) =>
          IncidentsRepositoryImpl(service: context.read()),
    ),
  ];
}

//view Models
List<SingleChildWidget> get _viewModelsProviders {
  return [
    ChangeNotifierProvider<ThemeControlViewModel>(
      create: (context) => ThemeControlViewModel(repository: context.read()),
    ),
    ChangeNotifierProvider<SuspectViewModel>(
      create: (context) => SuspectViewModel(
        repository: context.read(), // O Provider busca o SuspectsRepository na árvore
      ),
    ),
  ];
}

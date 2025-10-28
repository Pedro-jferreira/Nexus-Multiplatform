import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_multiplatform/data/repositories/auth_repository.dart';
import 'package:nexus_multiplatform/data/repositories/impl/auth_repository_impl.dart';
import 'package:nexus_multiplatform/data/services/auth_service.dart';
import 'package:nexus_multiplatform/data/services/impl/auth_service_impl.dart';
import 'package:nexus_multiplatform/data/services/impl/users_service_impl.dart';
import 'package:nexus_multiplatform/data/services/users_service.dart';
import 'package:nexus_multiplatform/routing/app_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
List<SingleChildWidget>  _initialization(prefs,dio) {
  return [Provider<SharedPreferences>.value(value: prefs),
    Provider<Dio>.value(value: dio),

    Provider<AuthService>(
      create: (context) => AuthServiceImpl(dio: context.read()),
    ),
    Provider<UsersServices>(
      create: (context) => UsersServiceImpl(dio: context.read()),
    ),

    Provider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(
        authService: context.read(),
        usersService: context.read(),
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

  ];
}

// repositories
List<SingleChildWidget> get _repositoriesData {
  return [

  ];
}

//view Models
List<SingleChildWidget> get _viewModelsProviders {
  return [];
}

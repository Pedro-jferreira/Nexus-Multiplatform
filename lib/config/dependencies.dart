

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> providers(SharedPreferences prefs,GoRouter router) {
  return [
    Provider<SharedPreferences>.value(value: prefs),
    Provider<GoRouter>.value(value: router),
    ..._servicesData,
    ..._repositoriesData,
    ..._viewModelsProviders,
  ];
}
//services
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
  return [

  ];
}

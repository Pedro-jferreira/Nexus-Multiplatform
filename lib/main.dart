import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_multiplatform/ui/core/theme/font.dart';
import 'package:nexus_multiplatform/ui/core/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/dependencies.dart';
import 'config/dio_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = DioConfig.createBaseDio(prefs: sharedPreferences);

  runApp(MyApp(
    sharedPreferences: sharedPreferences,
    dio: dio,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final Dio dio;

  const MyApp({
    super.key,
    required this.sharedPreferences,
    required this.dio,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Montserrat");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: providers(sharedPreferences, dio),
      child: Builder(
        builder: (context) {
          final router = context.read<GoRouter>();
          return MaterialApp.router(
            title: 'Nexus',
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: ThemeMode.system,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
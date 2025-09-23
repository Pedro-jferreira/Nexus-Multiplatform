import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_multiplatform/routing/app_router.dart';
import 'package:nexus_multiplatform/ui/core/theme/font.dart';
import 'package:nexus_multiplatform/ui/core/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final router = createRouter();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    router: router,
    sharedPreferences: sharedPreferences,
  ));
}
class MyApp extends StatelessWidget {
  final GoRouter router;
  final SharedPreferences sharedPreferences;

  const MyApp({
    super.key,
    required this.router,
    required this.sharedPreferences,
  });


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Montserrat");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
      providers: providers(sharedPreferences, router),
      child: MaterialApp.router(
        title: 'IF Inclusivo',
        theme: theme.light(),
        darkTheme: theme.dark(),
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}
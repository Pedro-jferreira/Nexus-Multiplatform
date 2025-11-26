import 'package:Nexus/ui/features/profile_web/view_model/theme_control_view_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:Nexus/ui/core/theme/font.dart';
import 'package:Nexus/ui/core/theme/theme_mobile.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/dependencies.dart';
import 'config/dio_config.dart';
import 'config/firebase_options.dart';
import 'ui/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


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
          final themeViewModel = context.watch<ThemeControlViewModel>();
          final router = context.read<GoRouter>();
          return OverlaySupport.global(child:MaterialApp.router(
            title: 'Nexus',
            theme: theme.light().copyWith(
              extensions: const [AppColors.light, ExtendedColorsTheme.light,],
            ),
            darkTheme: theme.dark().copyWith(
              extensions: const [AppColors.dark,  ExtendedColorsTheme.dark,],
            ),
            themeMode: themeViewModel.themeMode,
            routerConfig: router,
          ));
        },
      ),
    );
  }
}

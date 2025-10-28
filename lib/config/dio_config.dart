
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioConfig {
  static Dio createDio({required GoRouter router, required SharedPreferences prefs}) {
    final baseUrl = dotenv.env['API_BASE_URL'];
    if (baseUrl == null) {
      throw Exception("A variável BASE_URL não foi encontrada no arquivo .env");
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = prefs.getString('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (e, handler) {
          if (e.response != null) {
            if (e.response!.statusCode == 401) {
              //retornar rota UnauthorizedRoute
              //router.push(UnauthorizedRoute().location);
            } else if (e.response!.statusCode == 500) {
              //retornar rota ServerErrorRoute
              //router.push(ServerErrorRoute().location);
            }
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
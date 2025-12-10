import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/auth_repository.dart';

class DioConfig {
  static Dio createBaseDio({required SharedPreferences prefs}) {
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
      ),
    );

    return dio;
  }

  static void attachInterceptors({
    required Dio dio,
    required GoRouter router,
    required AuthRepository authRepository,
  }) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          final isGoogleRedirect = response.realUri.toString().contains('accounts.google.com');
          final isHtmlContent = response.headers.value('content-type')?.contains('text/html') ?? false;

          if (isGoogleRedirect || isHtmlContent) {
            if (authRepository.currentUser != null) {
              authRepository.logout();
            }

            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                error: 'Sessão expirada (Redirecionamento detectado)',
                type: DioExceptionType.badResponse,
                response: response,
              ),
            );
          }

          // Se for JSON normal, segue o fluxo
          return handler.next(response);
        },
        onError: (e, handler) {
          if (e.response != null) {
            if (e.response!.statusCode == 401) {
              //retornar rota UnauthorizedRoute
              if(authRepository.currentUser != null){
                authRepository.logout();
              }
            } else if (e.response!.statusCode == 500) {
              //retornar rota ServerErrorRoute
              //router.push(ServerErrorRoute().location);
            }
          }
          return handler.next(e);
        },
      ),
    );
  }
}

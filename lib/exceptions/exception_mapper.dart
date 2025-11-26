import 'package:dio/dio.dart';
import 'package:Nexus/exceptions/parse_exception.dart';

import 'api_exceptions.dart';
import 'app_exceptions.dart';


class ExceptionMapper {
  static AppException map(dynamic error) {
    if (error is AppException) return error;

    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return const NetworkException("Tempo de conexão esgotado. Verifique sua internet.");
      }

      if (error.response != null) {
        final status = error.response!.statusCode;
        final message = _extractMessage(error.response!.data);

        if (status == 401) {
          return ApiException("Sessão expirada. Faça login novamente.", statusCode: status);
        }
        if (status == 409) {
          return ApiException(message ?? "Conflito ao processar solicitação.", statusCode: status);
        }
        if (status == 500) {
          return ApiException("Erro interno do servidor.", statusCode: status);
        }

        return ApiException(message ?? "Erro ao comunicar com o servidor.", statusCode: status);
      }

      return const NetworkException("Erro de conexão. Verifique sua internet.");
    }

    if (error is FormatException || error is TypeError) {
      return const ParseException("Erro ao interpretar dados do servidor.");
    }

    return GenericException(error.toString());
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('message')) return data['message']?.toString();
      if (data.containsKey('error')) return data['error']?.toString();
    }
    if (data is String) return data;
    return null;
  }
}

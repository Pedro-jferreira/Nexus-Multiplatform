import 'package:Nexus/data/services/incidents_service.dart';
import 'package:dio/dio.dart';

class IncidentsServiceImpl implements IncidentsService {
  final Dio _dio;
  static const String path = '/incidents';
  IncidentsServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>> list({int page = 0, int size = 10}) async {
    final response = await _dio.get(
      path,
      queryParameters: {'page': page, 'size': size},
    );
    return response.data as Map<String, dynamic>;
  }
}

import 'dart:typed_data';

import 'package:Nexus/data/services/incidents_service.dart';
import 'package:dio/dio.dart';

class IncidentsServiceImpl implements IncidentsService {
  final Dio _dio;
  static const String path = '/incidents';
  static const String reportPath = '/reports/access-logs';
  IncidentsServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>> list({int page = 0, int size = 10}) async {
    final response = await _dio.get(
      path,
      queryParameters: {'page': page, 'size': size, 'sort': 'createdAt,desc',},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Uint8List> downloadReport(Map<String, dynamic> request) async {
    final response = await _dio.get(
      reportPath,
      queryParameters: request,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    return Uint8List.fromList(response.data);
  }
  @override
  Future<Map<String, dynamic>> update(int id, Map<String, dynamic> data) async {
    final response = await _dio.put('$path/$id', data: data);
    return response.data as Map<String, dynamic>;
  }
}

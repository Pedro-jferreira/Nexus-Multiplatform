import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../../domain/models/requests/gen_models.dart';
import '../suspect_service.dart';

class SuspectsServiceImpl implements SuspectsService {
  final Dio _dio;
  static const String path = '/suspects';
  SuspectsServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> create({
    required Map<String, dynamic> data,
    required FileRequest file,
  }) async {
    final formData = FormData();

    formData.files.add(
      MapEntry(
        'data',
        MultipartFile.fromString(
          jsonEncode(data),
          contentType: MediaType('application', 'json'),
        ),
      ),
    );

    if (file.file != null) {
      formData.files.add(
        MapEntry(
          'image',
          MultipartFile.fromBytes(
            file.file!,
            filename: file.fileName,
            contentType: MediaType(
              'image',
              file.fileName?.split('.').last.toLowerCase() ?? 'jpeg',
            ),
          ),
        ),
      );
    }

   await _dio.post(
      path,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

  }

  @override
  Future<Map<String, dynamic>> getById(int id) async {
    final response = await _dio.get('$path/$id');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> list({required Map<String, dynamic> filters}) async {

    final response = await _dio.get(
      path,
      queryParameters: filters,
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {

    final response = await _dio.put(
      '$path/$id',
      data: data,
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> delete(int id) async {
    await _dio.delete('$path/$id');
  }
}
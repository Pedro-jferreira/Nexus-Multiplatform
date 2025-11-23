import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart' show MediaType;

import '../../../domain/models/requests/gen_models.dart';
import '../emergency_contacts_service.dart';

class EmergencyContactsServiceImpl implements EmergencyContactsService {
  final Dio _dio;
  static const String path = '/emergency-contacts';

  EmergencyContactsServiceImpl({required Dio dio}) : _dio = dio;
  @override
  Future<Map<String, dynamic>> create({
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
          'file',
          MultipartFile.fromBytes(
            file.file!,
            filename: file.fileName,
            contentType: MediaType(
              'image',
              file.fileName!.split('.').last.toLowerCase(),
            ),
          ),
        ),
      );
    }

    final response = await _dio.post(
      path,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getById(int id) async {
    final response = await _dio.get('$path/$id');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> list({int page = 0, int size = 10}) async {
    final response = await _dio.get(
      path,
      queryParameters: {'page': page, 'size': size},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> update({
    required int id,
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
          'file',
          MultipartFile.fromBytes(
            file.file!,
            filename: file.fileName,
            contentType: MediaType(
              'image',
              file.fileName!.split('.').last.toLowerCase(),
            ),
          ),
        ),
      );
    }
    final response = await _dio.put(
      '$path/$id',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> delete(int id) async {
    await _dio.delete('$path/$id');
  }
}

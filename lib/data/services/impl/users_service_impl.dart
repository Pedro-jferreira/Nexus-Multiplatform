import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:Nexus/data/services/users_service.dart';
import 'package:http_parser/http_parser.dart';

import '../../../domain/models/requests/gen_models.dart';

class UsersServiceImpl implements UsersServices{
  final Dio _dio;
  static const String path = '/user';
  UsersServiceImpl({required Dio dio}) : _dio = dio;


  @override
  Future<Map<String, dynamic>> create({
    required Map<String, dynamic> data,
    required FileRequest file,
  }) async {
    final formData = FormData();
    formData.files.add(
      MapEntry(
        'req',
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
    required FileRequest file,
  }) async {
    final formData = FormData();
    formData.files.add(
      MapEntry(
        'req',
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
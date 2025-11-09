import 'package:dio/dio.dart';
import 'package:nexus_multiplatform/data/services/auth_service.dart';

class AuthServiceImpl implements AuthService{
  final Dio _dio;
  static const String path = '/api/nexus/auth';
  AuthServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>> login({required Map<String, dynamic> loginRequest}) async {
    final response = await _dio.post('$path/login', data: loginRequest);
    return response.data;
  }

  @override
  Future<void> logout() async {
    final response = await _dio.post('$path/logout',);
    return response.data;
  }

}
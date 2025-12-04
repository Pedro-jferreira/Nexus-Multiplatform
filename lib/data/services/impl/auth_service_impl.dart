import 'package:dio/dio.dart';
import 'package:Nexus/data/services/auth_service.dart';

class AuthServiceImpl implements AuthService{
  final Dio _dio;
  static const String path = '/auth';
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
  @override
  Future<void> updatePassword({required String userId, required Map<String, dynamic> request}) async {
    await _dio.patch(
      '/user/$userId/password',
      data: request,
    );
  }

  @override
  Future<void> requestUnlock({required Map<String, dynamic> request}) async {
    await _dio.post(
      '/unlock-request',
      data: request,
    );
  }
}
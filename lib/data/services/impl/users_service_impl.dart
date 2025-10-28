import 'package:dio/dio.dart';
import 'package:nexus_multiplatform/data/services/users_service.dart';

class UsersServiceImpl implements UsersServices{
  final Dio _dio;
  static const String path = '/api/nexus/user';
  UsersServiceImpl({required Dio dio}) : _dio = dio;


  @override
  Future<Map<String, dynamic>> findByID({required int userID}) async {
   final response = await _dio.get('$path/$userID');
   return response.data;
  }
}
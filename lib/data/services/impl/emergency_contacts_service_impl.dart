import 'package:dio/dio.dart';

import '../../../domain/models/requests/gen_models.dart';
import '../emergency_contacts_service.dart';

class EmergencyContactsServiceImpl implements EmergencyContactsService{
  final Dio _dio;
  static const String path = '/api/nexus/emergency-contacts"';

  EmergencyContactsServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>> getEmergencyContacts({int page = 0, int size = 5,}) async {
    final queryParams = <String, dynamic>{};

    queryParams['pages'] = page;
    queryParams['size'] = size;

    final response = await _dio.get(path, queryParameters: queryParams);
    print('dentro do service $response.data');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> create({required Map<String, dynamic> data, required FileRequest file}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> list({int page = 0, int size = 10}) {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> update({required int id, required Map<String, dynamic> data, required FileRequest file}) {
    // TODO: implement update
    throw UnimplementedError();
  }

}
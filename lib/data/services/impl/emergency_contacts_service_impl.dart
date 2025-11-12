import 'package:dio/dio.dart';
import 'package:nexus_multiplatform/data/services/emergency_contacts_service.dart';

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
}
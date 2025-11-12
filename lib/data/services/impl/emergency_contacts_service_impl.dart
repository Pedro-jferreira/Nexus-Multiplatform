import 'package:dio/dio.dart';
import 'package:nexus_multiplatform/data/services/emergency_contacts_service.dart';

class EmergencyContactsServiceImpl implements EmergencyContactsService{
  final Dio _dio;
  static const String path = '/api/nexus/emergency-contacts"';

  EmergencyContactsServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>> getEmergencyContacts() async {
    final response = await _dio.get(path);
    return response.data;
  }
}
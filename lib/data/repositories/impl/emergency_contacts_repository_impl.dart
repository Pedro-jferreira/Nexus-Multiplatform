import 'package:dio/dio.dart';
import 'package:nexus_multiplatform/data/repositories/emergency_contacts_repository.dart';
import 'package:nexus_multiplatform/data/services/emergency_contacts_service.dart';
import 'package:nexus_multiplatform/domain/models/responses/gen_models.dart';

import '../../../exceptions/api_exceptions.dart';

class EmergencyContactsRepositoryImpl implements EmergencyContactsRepository{
  final EmergencyContactsService _emergencyService;

  EmergencyContactsRepositoryImpl({required EmergencyContactsService service}) : _emergencyService = service;

  @override
  Future<PaginatedResponse<EmergencyContactsResponse>> getEmergencyContacts({int page = 0, int size = 5,}) async {
    try{
      final data = await _emergencyService.getEmergencyContacts();
      var response = PaginatedResponse.fromJson(data, (json) => EmergencyContactsResponse.fromJson(json as Map<String, dynamic>));
      print('dentro do repository $response');
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final response = e.response!.data;
        String errorMessage = 'erro inesperado';

        if (response is Map && response.containsKey('message')) {
          errorMessage = response['message'];
        }

        switch (statusCode) {
          case 409:
            throw ApiException(errorMessage);
          case 500:
            throw ApiException(errorMessage);
        }
      }

      throw Exception(
        'falha de conexão, verifique sua internet e tente mais tarde. dentro $e',
      );
    } catch (e) {
      throw Exception(
        'falha de conexão, verifique sua internet e tente mais tarde. fora $e',
      );
    }
  }
}
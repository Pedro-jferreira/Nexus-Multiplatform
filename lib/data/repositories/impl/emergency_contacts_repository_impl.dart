import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/src/types.dart';

import '../../../domain/models/responses/gen_models.dart';
import '../../../exceptions/api_exceptions.dart';
import '../../services/emergency_contacts_service.dart';
import '../emergency_contact_repository.dart';

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

  @override
  AsyncResult<EmergencyContactResponse> create({required CreateEmergencyContactRequest model, required FileRequest file}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  AsyncResult<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  AsyncResult<EmergencyContactResponse> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  AsyncResult<PageResponse<EmergencyContactResponse>> list({int page = 0, int size = 10}) {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  AsyncResult<EmergencyContactResponse> update(int id, UpdateEmergencyContactRequest model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
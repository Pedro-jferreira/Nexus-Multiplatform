import 'dart:io';
import 'dart:typed_data';

import 'package:Nexus/data/repositories/emergency_contact_repository.dart';
import 'package:Nexus/data/services/emergency_contacts_service.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:result_dart/result_dart.dart';

import '../../../exceptions/exception_mapper.dart';

class EmergencyContactsRepositoryImpl implements EmergencyContactsRepository {
  final EmergencyContactsService _service;

  EmergencyContactsRepositoryImpl({required EmergencyContactsService service})
    : _service = service;

  @override
  AsyncResult<EmergencyContactResponse> create({
    required CreateEmergencyContactRequest model,
    required FileRequest file,
  }) async {
    try {
      final json = await _service.create(data: model.toJson(), file: file);

      final result = EmergencyContactResponse.fromJson(json);

      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<void> delete(int id) async {
    try {
      await _service.delete(id);
      return const Success(Null);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<EmergencyContactResponse> getById(int id) async {
    try {
      final json = await _service.getById(id);
      final result = EmergencyContactResponse.fromJson(json);
      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<PageResponse<EmergencyContactResponse>> list({
    int page = 0,
    int size = 10,
  }) async {
    try {
      final json = await _service.list(page: page, size: size);
      final result = PageResponse<EmergencyContactResponse>.fromJson(
        json,
        (e) => EmergencyContactResponse.fromJson(e as Map<String, dynamic>),
      );

      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<EmergencyContactResponse> update(
    int id,
    UpdateEmergencyContactRequest model,
  ) async {
    try {
      final json = await _service.update(id, model.toJson());
      final result = EmergencyContactResponse.fromJson(json);
      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }
}

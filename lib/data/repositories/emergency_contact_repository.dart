import 'dart:typed_data';

import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:result_dart/result_dart.dart';

abstract class EmergencyContactsRepository {
  AsyncResult<EmergencyContactResponse> create({
    required CreateEmergencyContactRequest model,
    required FileRequest file,
  });

  AsyncResult<EmergencyContactResponse> getById(int id);

  AsyncResult<PageResponse<EmergencyContactResponse>> list({
    int page = 0,
    int size = 10,
  });

  AsyncResult<EmergencyContactResponse> update({
    required int id,
    required UpdateEmergencyContactRequest model,
    required FileRequest file,
  });

  AsyncResult<void> delete(int id);
}

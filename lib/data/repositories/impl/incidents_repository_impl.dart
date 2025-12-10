import 'package:Nexus/data/repositories/incident_repository.dart';
import 'package:Nexus/data/services/incidents_service.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/models/responses/gen_models.dart';
import '../../../exceptions/exception_mapper.dart';

class IncidentsRepositoryImpl implements IncidentRepository{
  final IncidentsService _service;

  IncidentsRepositoryImpl({required IncidentsService service}) : _service = service;
  @override
  AsyncResult<PageResponse<IncidentResponse>> list({int page = 0, int size = 10})async {
    try {
      final json = await _service.list(page: page, size: size);
      final result = PageResponse<IncidentResponse>.fromJson(
        json,
            (e) => IncidentResponse.fromJson(e as Map<String, dynamic>),
      );

      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }
}
import 'package:result_dart/result_dart.dart';

import '../../../domain/models/requests/gen_models.dart';
import '../../../domain/models/responses/gen_models.dart';
import '../../../exceptions/exception_mapper.dart';
import '../../services/suspect_service.dart';
import '../suspects_repository.dart';

class SuspectsRepositoryImpl implements SuspectsRepository {
  final SuspectsService _service;

  SuspectsRepositoryImpl({required SuspectsService service})
      : _service = service;

  @override
  AsyncResult<Unit> create({
    required CreateSuspectRequest model,
    required FileRequest file,
  }) async {
    try {
      await _service.create(data: model.toJson(), file: file);

      return Success.unit();
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<SuspectResponse> getById(int id) async {
    try {
      final json = await _service.getById(id);
      final result = SuspectResponse.fromJson(json);
      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<PageResponse<SuspectResponse>> list({
    required SuspectFilter filter
  }) async {
    try {
      final json = await _service.list(filters: filter.toQueryParams());

      final result = PageResponse<SuspectResponse>.fromJson(
        json,
            (e) => SuspectResponse.fromJson(e as Map<String, dynamic>),
      );

      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<SuspectResponse> update({
    required int id,
    required UpdateSuspectRequest model,
  }) async {
    try {
      final json = await _service.update(
          id: id,
          data: model.toJson(),
      );

      final result = SuspectResponse.fromJson(json);
      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<Unit> delete(int id) async {
    try {
      await _service.delete(id);
      return Success.unit();
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }
}
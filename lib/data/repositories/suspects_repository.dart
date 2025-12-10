import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:result_dart/result_dart.dart';

abstract class SuspectsRepository{
  AsyncResult<Unit> create({
    required CreateSuspectRequest model,
    required FileRequest file,
  });

  AsyncResult<SuspectResponse> getById(int id);

  AsyncResult<PageResponse<SuspectResponse>> list({
    required SuspectFilter filter
  });

  AsyncResult<SuspectResponse> update({
    required int id,
    required UpdateSuspectRequest model,
  });

  AsyncResult<Unit> delete(int id);
}
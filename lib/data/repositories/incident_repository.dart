import 'package:result_dart/result_dart.dart';

import '../../domain/models/responses/gen_models.dart';

abstract class IncidentRepository {
  AsyncResult<PageResponse<IncidentResponse>> list({
    int page = 0,
    int size = 10,
  });
}
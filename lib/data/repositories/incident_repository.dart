import 'dart:typed_data';

import 'package:result_dart/result_dart.dart';

import '../../domain/models/requests/gen_models.dart';
import '../../domain/models/responses/gen_models.dart';

abstract class IncidentRepository {
  AsyncResult<PageResponse<IncidentResponse>> list({
    int page = 0,
    int size = 10,
  });
  AsyncResult<Uint8List> downloadReport(AccessLogReportRequest request);
  AsyncResult<IncidentResponse> update(int id, UpdateIncidentRequest request);
}
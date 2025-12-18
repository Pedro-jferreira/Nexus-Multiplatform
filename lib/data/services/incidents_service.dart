import 'dart:typed_data';

abstract class IncidentsService {

  Future<Map<String, dynamic>> list({int page = 0, int size = 10});
  Future<Uint8List> downloadReport(Map<String, dynamic> request);
  Future<Map<String, dynamic>> update(int id, Map<String, dynamic> data);
}
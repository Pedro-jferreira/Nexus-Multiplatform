abstract class IncidentsService {

  Future<Map<String, dynamic>> list({int page = 0, int size = 10});
}
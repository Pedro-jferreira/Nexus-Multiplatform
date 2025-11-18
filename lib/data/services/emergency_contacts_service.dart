
import '../../domain/models/requests/gen_models.dart';

abstract class EmergencyContactsService {
  Future<Map<String, dynamic>> create({
    required Map<String, dynamic> data,
    required FileRequest file,
  });

  Future<Map<String, dynamic>> getById(int id);

  Future<Map<String, dynamic>> list({
    int page = 0,
    int size = 10,
  });

  Future<Map<String, dynamic>> update(int id, Map<String, dynamic> data);

  Future<void> delete(int id);

  Future getEmergencyContacts() async {}
}
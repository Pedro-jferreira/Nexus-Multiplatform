
import '../../domain/models/requests/gen_models.dart';

abstract class UsersServices{

  Future<Map<String, dynamic>> create({
    required Map<String, dynamic> data,
    required FileRequest file,
  });

  Future<Map<String, dynamic>> getById(int id);

  Future<Map<String, dynamic>> list({required Map<String, dynamic> filters});

  Future<Map<String, dynamic>> update({
    required int id,
    required Map<String, dynamic> data,
    required FileRequest file,
  });

  Future<void> delete(int id);
}
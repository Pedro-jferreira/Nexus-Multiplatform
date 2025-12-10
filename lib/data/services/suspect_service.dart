import '../../domain/models/requests/gen_models.dart';

abstract class SuspectsService{

  Future<void> create({
    required Map<String, dynamic> data,
    required FileRequest file,
  });

  Future<Map<String, dynamic>> getById(int id);

  Future<Map<String, dynamic>> list({required Map<String, dynamic> filters});

  Future<Map<String, dynamic>> update({
    required int id,
    required Map<String, dynamic> data,
  });

  Future<void> delete(int id);

}
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:result_dart/result_dart.dart';

abstract class UserRepository{
  AsyncResult<UserResponse> create({
    required CreateUserRequest model,
    required FileRequest file,
  });

  AsyncResult<UserResponse> getById(int id);

  AsyncResult<PageResponse<UserResponse>> list({
    required UserFilter filter
  });

  AsyncResult<UserResponse> update({
    required int id,
    required UpdateUserRequest model,
    required FileRequest file,
  });

  AsyncResult<Unit> delete(int id);
}
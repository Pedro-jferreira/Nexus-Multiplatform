

import 'package:Nexus/data/repositories/user_repository.dart';

import 'package:Nexus/data/services/users_service.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:result_dart/result_dart.dart';

import '../../../exceptions/exception_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UsersServices _service;

  UserRepositoryImpl({required UsersServices service})
      : _service = service;

  @override
  AsyncResult<UserResponse> create({
    required CreateUserRequest model,
    required FileRequest file,
  }) async {
    try {
      final json = await _service.create(data: model.toJson(), file: file);

      final result = UserResponse.fromJson(json);

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

  @override
  AsyncResult<UserResponse> getById(int id) async {
    try {
      final json = await _service.getById(id);
      final result = UserResponse.fromJson(json);
      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<PageResponse<UserResponse>> list({
    required UserFilter filter
  }) async {
    try {
      final json = await _service.list(filters: filter.toQueryParams());
      final result = PageResponse<UserResponse>.fromJson(
        json,
            (e) => UserResponse.fromJson(e as Map<String, dynamic>),
      );

      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<UserResponse> update({
    required int id,
    required UpdateUserRequest model,
    required FileRequest file,
  }) async {
    try {
      final json = await _service.update(id: id,data:  model.toJson(), file: file);
      final result = UserResponse.fromJson(json);
      return Success(result);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }
}

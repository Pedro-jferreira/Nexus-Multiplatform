import 'package:Nexus/data/repositories/user_repository.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:flutter/foundation.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/models/enums/api_enums.dart';
import '../../../../guards/roles.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _repository;

  UserViewModel({required UserRepository repository})
    : _repository = repository {
    fetchCmd = Command0(_fetch);
    fetchMoreCmd = Command0(_fetchMoreUsers);
    createCmd = Command1(_createUser);
    updateCmd = Command1(_updateUser);
    deleteCmd = Command1<Unit, int>(_deleteUser);
  }

  final List<UserResponse> _users = [];
  List<UserResponse> get users => List.unmodifiable(_users);

  int _currentPage = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  final int _pageSize = 10;
  late final Command0<List<UserResponse>> fetchCmd;
  late final Command0<List<UserResponse>> fetchMoreCmd;
  late final Command1<UserResponse, FilePayload<CreateUserRequest>> createCmd;
  late final Command1<UserResponse, FilePayloadUpdate<UpdateUserRequest>>
  updateCmd;
  late final Command1<Unit, int> deleteCmd;
  UserFilter _filter = const UserFilter();
  UserFilter get filter => _filter;

  void updateFilter({
    Optional<Role>? role,
    Optional<EnumStatus>? status,
    Optional<String>? query,
  }) {
    _filter = _filter.copyWith(
      role: role?.isPresent == true ? role!.value : _filter.role,
      status: status?.isPresent == true ? status!.value : _filter.status,
      query: query?.isPresent == true ? query!.value : _filter.query,
      page: 0,
      size: _pageSize,
    );

    _currentPage = 0;
    fetchCmd.execute();
    notifyListeners();
  }

  AsyncResult<List<UserResponse>> _fetch() async {
    return await _repository.list(filter: _filter).mapFold((onSuccess) {
      _users.clear();
      _users.addAll(onSuccess.content.toList());
      _hasMore = !onSuccess.last;
      notifyListeners();
      return onSuccess.content;
    }, (onError) => onError);
  }

  AsyncResult<List<UserResponse>> _fetchMoreUsers() async {
    if (!_hasMore) {
      return Failure(Exception('Não há mais páginas para carregar'));
    }
    _currentPage++;
    final nextFilter = _filter.copyWith(page: _currentPage, size: _pageSize);

    final result = await _repository.list(filter: nextFilter);

    return result.mapFold((page) {
      _users.addAll(page.content.toList());
      _hasMore = !page.last;
      notifyListeners();
      return _users;
    }, (error) => error);
  }

  AsyncResult<UserResponse> _createUser(
    FilePayload<CreateUserRequest> model,
  ) async {
    final result = await _repository.create(
      model: model.request,
      file: model.file,
    );
    return result.mapFold((user) {
      _users.insert(0, user); // adiciona no topo
      notifyListeners();
      return user;
    }, (error) => error);
  }

  AsyncResult<UserResponse> _updateUser(
    FilePayloadUpdate<UpdateUserRequest> model,
  ) async {
    final result = await _repository.update(
      id: model.id,
      model: model.request,
      file: model.file,
    );
    return result.mapFold((updated) {
      final index = _users.indexWhere((c) => c.id == model.id);
      if (index != -1) {
        _users[index] = updated;
        notifyListeners();
      }
      return updated;
    }, (error) => error);
  }

  AsyncResult<Unit> _deleteUser(int id) async {
    final result = await _repository.delete(id);
    return result.mapFold((result) {
      _users.removeWhere((c) => c.id == id);
      notifyListeners();
      return result;
    }, (error) => error);
  }
}

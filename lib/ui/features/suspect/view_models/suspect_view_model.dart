import 'package:Nexus/data/repositories/suspects_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/models/enums/api_enums.dart';
import '../../../../domain/models/requests/gen_models.dart';
import '../../../../domain/models/responses/gen_models.dart';

class SuspectViewModel extends ChangeNotifier {
  final SuspectsRepository _repository;

  SuspectViewModel({required SuspectsRepository repository})
    : _repository = repository {
    fetchCmd = Command0(_fetch);
    fetchMoreCmd = Command0(_fetchMoreSuspects);
    createCmd = Command1(_createSuspect);
    updateCmd = Command1(_updateSuspect);
    deleteCmd = Command1(_deleteSuspect);
  }

  final List<SuspectResponse> _suspects = [];
  List<SuspectResponse> get suspects => List.unmodifiable(_suspects);

  int _currentPage = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  final int _pageSize = 10;
  late final Command0<List<SuspectResponse>> fetchCmd;
  late final Command0<List<SuspectResponse>> fetchMoreCmd;
  late final Command1<Unit, FilePayload<CreateSuspectRequest>>
  createCmd;
  late final Command1<SuspectResponse, FilePayloadUpdate<UpdateSuspectRequest>>
  updateCmd;
  late final Command1<Unit, int> deleteCmd;
  SuspectFilter _filter = const SuspectFilter();
  SuspectFilter get filter => _filter;

  void updateFilter({
    Optional<SuspectStatus>? status,
    Optional<String>? query,
  }) {
    _filter = _filter.copyWith(
      status: status?.isPresent == true ? status!.value : _filter.status,
      query: query?.isPresent == true ? query!.value : _filter.query,
      page: 0,
      size: _pageSize,
    );
    _currentPage = 0;
    fetchCmd.execute();
    notifyListeners();
  }

  AsyncResult<List<SuspectResponse>> _fetch() async {
    return await _repository.list(filter: _filter).mapFold((onSuccess) {
      _suspects.clear();
      _suspects.addAll(onSuccess.content.toList());
      _hasMore = !onSuccess.last;
      notifyListeners();
      return onSuccess.content;
    }, (onError) => onError);
  }

  AsyncResult<List<SuspectResponse>> _fetchMoreSuspects() async {
    if (!_hasMore) {
      return Failure(Exception('Não há mais páginas para carregar'));
    }
    _currentPage++;
    final nextFilter = _filter.copyWith(page: _currentPage, size: _pageSize);

    final result = await _repository.list(filter: nextFilter);

    return result.mapFold((page) {
      _suspects.addAll(page.content.toList());
      _hasMore = !page.last;
      notifyListeners();
      return _suspects;
    }, (error) => error);
  }

  AsyncResult<Unit> _createSuspect(
    FilePayload<CreateSuspectRequest> model,
  ) async {
    return  await _repository.create(
      model: model.request,
      file: model.file,
    );
  }

  AsyncResult<SuspectResponse> _updateSuspect(
    FilePayloadUpdate<UpdateSuspectRequest> model,
  ) async {
    final result = await _repository.update(
      id: model.id,
      model: model.request,
    );
    return result.mapFold((updated) {
      final index = _suspects.indexWhere((c) => c.id == model.id);
      if (index != -1) {
        _suspects[index] = updated;
        notifyListeners();
      }
      return updated;
    }, (error) => error);
  }

  AsyncResult<Unit> _deleteSuspect(int id) async {
    final result = await _repository.delete(id);
    return result.mapFold((result) {
      _suspects.removeWhere((c) => c.id == id);
      notifyListeners();
      return result;
    }, (error) => error);
  }
}

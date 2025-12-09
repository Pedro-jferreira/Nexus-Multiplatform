import 'package:Nexus/data/repositories/suspects_repository.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/models/enums/api_enums.dart';
import '../../../../domain/models/requests/gen_models.dart';

class IncidentsMobileViewModel extends ChangeNotifier {
  final SuspectsRepository _repository;

  IncidentsMobileViewModel({required SuspectsRepository repository}) : _repository = repository {
    fetchCmd = Command0(_fetch);
    fetchMoreCmd = Command0(_fetchMore);
    fetchById = Command1(_fetchById);
  }

  final List<SuspectResponse> _suspects = [];
  List<SuspectResponse> get suspects => _suspects;

  late final Command0<List<SuspectResponse>> fetchCmd;
  late final Command0<List<SuspectResponse>> fetchMoreCmd;
  late final Command1<SuspectResponse, int> fetchById;

  SuspectResponse _suspetcById = SuspectResponse(id: 0, name: '', birthDate: DateTime.now(), cpf: '', description: '', images: [], suspectStatus: SuspectStatus.CAPTURADO);
  SuspectResponse get suspectById => _suspetcById;

  int _currentPage = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;
  final int _pageSize = 10;
  SuspectFilter _filter = const SuspectFilter();

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

  AsyncResult<SuspectResponse> _fetchById(int id) async {
    return await _repository.getById(id).mapFold((onSuccess) {
      _suspetcById = onSuccess;
      notifyListeners();
      return _suspetcById;
    }, (onError) => onError);
  }

  AsyncResult<List<SuspectResponse>> _fetchMore() async {
    if (!_hasMore) {
      return Failure(Exception('Nenhum aleta detectado no momento.\n Novas detecções aparecerão aqui.'));
    }

    _currentPage++;

    final fetchMoreFilter = _filter.copyWith(page: _currentPage, size: _pageSize);

    return await _repository.list(filter: fetchMoreFilter).mapFold((onSuccess) {
      _suspects.addAll(onSuccess.content.toList());
      _hasMore = !onSuccess.last;
      notifyListeners();
      return _suspects;
    }, (onError) => onError);
  }
}
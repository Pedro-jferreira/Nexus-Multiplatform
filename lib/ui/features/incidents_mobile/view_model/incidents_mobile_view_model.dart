import 'package:Nexus/data/repositories/suspects_repository.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/models/enums/api_enums.dart';
import '../../../../domain/models/requests/gen_models.dart';
import '../../../../guards/roles.dart';

class IncidentsMobileViewModel extends ChangeNotifier {
  final SuspectsRepository _repository;

  IncidentsMobileViewModel({required SuspectsRepository repository}) : _repository = repository;

  final List<SuspectResponse> _suspects = [];
  List<SuspectResponse> get suspects => _suspects;

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

  AsyncResult<PageResponse<SuspectResponse>> _fetch() async {
    return _repository.list(filter: _filter);
  }
}
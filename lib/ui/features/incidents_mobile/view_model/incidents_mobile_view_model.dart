import 'package:Nexus/data/repositories/suspects_repository.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:Nexus/ui/features/incidents_mobile/mock/mock_incident_model.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/models/enums/api_enums.dart';
import '../mock/mock_incidents_data.dart';

class IncidentsMobileViewModel extends ChangeNotifier {
  final SuspectsRepository _repository;

  IncidentsMobileViewModel({required SuspectsRepository repository})
    : _repository = repository {
    fetchCmd = Command0(_fetch);
    fetchMoreMockCmd = Command0(_fetchMoreMock);
    fetchById = Command1(_fetchById);
  }

  final List<IncidentModel> _incidents = [];
  List<IncidentModel> get incidentes => _incidents;

  late final Command0<List<IncidentModel>> fetchCmd;
  late final Command0<List<IncidentModel>> fetchMoreMockCmd;
  late final Command1<SuspectResponse, int> fetchById;

  SuspectResponse _suspetcById = SuspectResponse(
    id: 0,
    name: '',
    birthDate: DateTime.now(),
    cpf: '',
    description: '',
    images: [],
    suspectStatus: SuspectStatus.CAPTURADO,
  );
  SuspectResponse get suspectById => _suspetcById;

  int _currentPage = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  AsyncResult<List<IncidentModel>> _fetch() async {
    await Future.delayed(const Duration(seconds: 1));

    _incidents.clear();
    _incidents.addAll(MockIncidents.incidents);

    notifyListeners();
    return Success(_incidents);
  }

  AsyncResult<SuspectResponse> _fetchById(int id) async {
    return await _repository.getById(id).mapFold((onSuccess) {
      _suspetcById = onSuccess;
      notifyListeners();
      return _suspetcById;
    }, (onError) => onError);
  }

  AsyncResult<List<IncidentModel>> _fetchMoreMock() async {
    if (!_hasMore) {
      return Success(_incidents);
    }

    await Future.delayed(const Duration(seconds: 2));

    final newItems = MockIncidents.incidents;

    _currentPage++;
    _incidents.addAll(newItems);

    if (_currentPage >= 5) {
      _hasMore = false;
    }

    notifyListeners();
    return Success(_incidents);
  }
}


import 'package:Nexus/domain/models/enums/api_enums.dart';
import 'package:flutter/foundation.dart';

import '../../../../data/repositories/incident_repository.dart';
import '../../../../domain/models/responses/gen_models.dart';

class IncidentViewModel extends ChangeNotifier {
   final IncidentRepository _repository;



  // Estados da View
  List<IncidentResponse> incidents = [];
  bool isLoading = false;
  bool isError = false;

  // Controle de Paginação
  int _currentPage = 0;
  bool _isLastPage = false;
  final int _pageSize = 10;

  IncidentViewModel({required IncidentRepository repository}) : _repository = repository;

  bool get hasMore => !_isLastPage;

  Future<void> loadIncidents() async {
    _currentPage = 0;
    _isLastPage = false;
    incidents = [];
    await _fetchPage();
  }

  Future<void> loadMore() async {
    if (isLoading || _isLastPage) return;
    _currentPage++;
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    isLoading = true;
    isError = false;
    notifyListeners();

    final result = await _repository.list(
      page: _currentPage,
      size: _pageSize,
    );

    result.fold(
          (success) {
            final existingIds = incidents.map((e) => e.id).toSet();
            final uniqueNewItems = success.content.where(
                    (incident) => !existingIds.contains(incident.id)
            ).toList();

            incidents.addAll(uniqueNewItems);
        _isLastPage = success.last;
        isLoading = false;
        notifyListeners();
      },
          (failure) {
            print(failure);
        isError = true;
        isLoading = false;
        // Se der erro ao carregar "mais", voltamos o índice da página
        if (_currentPage > 0) _currentPage--;
        notifyListeners();
      },
    );
  }

   bool isUpdating = false;

   Future<void> updateIncident(int id, IncidentStatus status) async {
     isUpdating = true;
     notifyListeners();
     final request = UpdateIncidentRequest(
       incidentStatus: status, // .name pega a String do Enum
     );
     final result = await _repository.update(id, request);

     result.fold(
           (updatedIncident) {
         final index = incidents.indexWhere((element) => element.id == id);
         if (index != -1) {
           incidents[index] = updatedIncident;
         }
         isUpdating = false;
         notifyListeners();
       },
           (failure) {
         isUpdating = false;
         notifyListeners();
       },
     );
   }
}
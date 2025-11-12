import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../../../data/repositories/emergency_contacts_repository.dart';
import '../../../../domain/models/responses/gen_models.dart';

enum EmergencyContactsState {
  idle,
  loading,
  loadingMore,
  error,
}

class EmergencyContactsViewModel with ChangeNotifier {
  final EmergencyContactsRepository _repository;

  EmergencyContactsViewModel({required EmergencyContactsRepository repository}) : _repository = repository;

  EmergencyContactsResponse? _singleEmergency;
  EmergencyContactsResponse? get singleEmergency => _singleEmergency;

  EmergencyContactsState _state = EmergencyContactsState.loading;
  EmergencyContactsState get state => _state;

  late String _errorMessage = '';
  String get errorMessage => _errorMessage;

  late List<EmergencyContactsResponse> _emergencies = [];
  UnmodifiableListView<EmergencyContactsResponse> get emergencies => UnmodifiableListView(_emergencies);

  getEmergencyContacts() async {
    if(_singleEmergency == null){
      _emergencies = [];
      _state = EmergencyContactsState.idle;
      notifyListeners();
      return;
    }

    _state = EmergencyContactsState.loading;
    notifyListeners();
    
    try{
      final response = await _repository.getEmergencyContacts();
      _emergencies = response.content;
      _state = EmergencyContactsState.idle;
    } catch (e) {
      _errorMessage = e.toString();
      _state = EmergencyContactsState.error;
    } finally{
      notifyListeners();
    }
  }
}
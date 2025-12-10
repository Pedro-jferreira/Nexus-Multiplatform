import 'package:flutter/foundation.dart';
import 'package:Nexus/data/repositories/emergency_contact_repository.dart';
import 'emergency_contacts_state.dart';


class EmergencyContactsNotifier extends ChangeNotifier {
  final EmergencyContactsRepository _repository;

  EmergencyContactsState _state = EmergencyContactsState();
  EmergencyContactsState get state => _state;

  EmergencyContactsNotifier({required EmergencyContactsRepository repository})
      : _repository = repository;

  Future<void> fetchContacts() async {
    _state = _state.copyWith(
      isLoading: true,
      errorMessage: null,
    );
    notifyListeners();
    final result = await _repository.list(
      page: _state.currentPage,
      size: 10,
    );
    result.fold(
          (pageResponse) {
        _state = _state.copyWith(
          isLoading: false,
          contacts: [..._state.contacts, ...pageResponse.content],
          currentPage: _state.currentPage + 1,
        );
      },
          (exception) {
        _state = _state.copyWith(
          isLoading: false,
          errorMessage: 'Falha ao carregar contatos: ${exception.toString()}',
        );
      },
    );
    notifyListeners();
  }
}
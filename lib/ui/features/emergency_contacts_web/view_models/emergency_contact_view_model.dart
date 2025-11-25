import 'package:flutter/foundation.dart';
import 'package:Nexus/data/repositories/emergency_contact_repository.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class EmergencyContactViewModel extends ChangeNotifier {
  final EmergencyContactsRepository _repository;

  EmergencyContactViewModel({required EmergencyContactsRepository repository})
    : _repository = repository{
    fetchCmd = Command0(_fetch);
    fetchMoreCmd =Command0(_fetchMoreContacts);
    createCmd = Command1(_createContact);
    updateCmd = Command1(_updateContact);
    deleteCmd = Command1<bool, int>(_deleteContact);
  }

  final List<EmergencyContactResponse> _contacts = [];
  List<EmergencyContactResponse> get contacts => List.unmodifiable(_contacts);

  int _currentPage = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  final int _pageSize = 10;
  late final Command0<List<EmergencyContactResponse>> fetchCmd;
  late final Command0<List<EmergencyContactResponse>> fetchMoreCmd;
  late final Command1<EmergencyContactResponse,FilePayload<CreateEmergencyContactRequest>> createCmd;
  late final Command1<EmergencyContactResponse, FilePayloadUpdate<UpdateEmergencyContactRequest>> updateCmd;
  late final Command1<bool, int> deleteCmd;

  AsyncResult<List<EmergencyContactResponse>> _fetch() async {
    return await _repository.list().mapFold((onSuccess) {
      _contacts.clear();
      _contacts.addAll(onSuccess.content.toList());
      _hasMore = !onSuccess.last;
      notifyListeners();
      return onSuccess.content;
    }, (onError) => onError);
  }

  AsyncResult<List<EmergencyContactResponse>>  _fetchMoreContacts() async {
    if (!_hasMore) {
      return Failure(Exception('Não há mais páginas para carregar'));
    }
    _currentPage++;

    final result = await _repository.list(page: _currentPage, size: _pageSize);

   return result.mapFold(
      (page) {
        _contacts.addAll(page.content.toList());
        _hasMore = !page.last;
        notifyListeners();
        return _contacts;
      },
       (error) =>error,
    );

  }
  AsyncResult<EmergencyContactResponse> _createContact(
      FilePayload<CreateEmergencyContactRequest> model) async {
    final result = await _repository.create(model: model.request, file: model.file);
    return result.mapFold((contact) {
      _contacts.insert(0, contact); // adiciona no topo
      notifyListeners();
      return contact;
    }, (error) => error);
  }

  AsyncResult<EmergencyContactResponse> _updateContact(FilePayloadUpdate<UpdateEmergencyContactRequest> model) async {
    final result = await _repository.update(id: model.id, model: model.request, file: model.file);
    return result.mapFold((updated) {
      final index = _contacts.indexWhere((c) => c.id == model.id);
      if (index != -1) {
        _contacts[index] = updated;
        notifyListeners();
      }
      return updated;
    }, (error) => error);
  }

  AsyncResult<bool> _deleteContact(int id) async {
    final result = await _repository.delete(id);
    return result.mapFold((_) {
      _contacts.removeWhere((c) => c.id == id);
      notifyListeners();
      return true;
    }, (error) => error);
  }
}

import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:flutter/foundation.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  final AuthRepository _repository;

  ResetPasswordViewModel({required AuthRepository repository})
      : _repository = repository {

    updateCmd = Command1(_update);
    _repository.addListener(_onRepositoryChanged);
  }

  late final Command1<Unit, UpdatePasswordRequest> updateCmd;

  bool get isTemporaryPassword => _repository.isTemporaryPassword;

  AsyncResult<Unit> _update(UpdatePasswordRequest request) async {
    return await _repository.updatePassword(request: request);
  }

  void _onRepositoryChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _repository.removeListener(_onRepositoryChanged);
    super.dispose();
  }
}
import 'package:flutter/foundation.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:result_command/result_command.dart';
import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _repository;

  LoginViewModel({required AuthRepository repository})
    : _repository = repository{
    loginCmd = Command1(_login);
  }

  late final Command1<UserResponse, LoginRequest> loginCmd;

  AsyncResult<UserResponse> _login(LoginRequest loginRequest) async =>
      await _repository.login(loginRequest: loginRequest);
}

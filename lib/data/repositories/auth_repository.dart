import 'package:flutter/foundation.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/models/responses/gen_models.dart';

abstract class AuthRepository extends ChangeNotifier{
  Stream<UserResponse?> get userStream;
  UserResponse? get currentUser;
  bool? get isTemporaryPassword;

  AsyncResult<UserResponse> login({required LoginRequest loginRequest});
  AsyncResult<void> logout();
}
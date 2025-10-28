import 'package:nexus_multiplatform/domain/models/requests/gen_models.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/models/responses/gen_models.dart';

abstract class AuthRepository{
  Stream<UserResponse?> get userStream;
  UserResponse? get currentUser;

  AsyncResult<void> login({required LoginRequest loginRequest});
  AsyncResult<void> logout();
}
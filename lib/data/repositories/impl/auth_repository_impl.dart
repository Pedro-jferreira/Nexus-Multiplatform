// lib/data/repositories/auth_repository_impl.dart
import 'dart:async';
import 'package:nexus_multiplatform/exceptions/parse_exception.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../domain/models/requests/gen_models.dart';
import '../../../domain/models/responses/gen_models.dart';

import '../../../exceptions/exception_mapper.dart';
import '../../services/auth_service.dart';
import '../../services/users_service.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final UsersServices _usersService;
  final SharedPreferences _prefs;

  final _userController = StreamController<UserResponse?>.broadcast();
  UserResponse? _currentUser;

  AuthRepositoryImpl({
    required AuthService authService,
    required UsersServices usersService,
    required SharedPreferences prefs,
  }) : _authService = authService,
       _usersService = usersService,
       _prefs = prefs;

  @override
  Stream<UserResponse?> get userStream => _userController.stream;

  @override
  UserResponse? get currentUser => _currentUser;

  @override
  AsyncResult<void> login({required LoginRequest loginRequest}) async {
    try {
      final data = await _authService.login(
        loginRequest: loginRequest.toJson(),
      );

      final token = AuthTokens.fromJson(data);

      await _saveTokens(token);

      final int? userId = _decodeUserIdFromJwt(token.accessToken);
      if (userId == null) {
        throw ParseException('Falha ao decodificar o token JWT');
      }

      final userData = await _usersService.findByID(userID: userId);
      final user = UserResponse.fromJson(userData);

      _setUser(user);

      return Success(Null);
    } catch (e) {
      return Failure(throw ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<void> logout() async {
    try {
      await _prefs.remove('auth_token');
      await _prefs.remove('refresh_token');
      _setUser(null);
      return Success(Null);
    } catch (e) {
      return Failure(throw ExceptionMapper.map(e));
    }
  }

  Future<void> _saveTokens(AuthTokens token) async {
    await _prefs.setString('auth_token', token.accessToken);
    await _prefs.setString('refresh_token', token.accessToken);
  }

  int? _decodeUserIdFromJwt(String token) {
    try {
      final decoded = Jwt.parseJwt(token);
      final sub = decoded['sub'];
      return int.tryParse(sub?.toString() ?? '');
    } catch (_) {
      return null;
    }
  }

  void _setUser(UserResponse? user) {
    _currentUser = user;
    _userController.add(user);
  }

  void dispose() {
    _userController.close();
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../domain/models/requests/gen_models.dart';
import '../../../domain/models/responses/gen_models.dart';

import '../../../exceptions/exception_mapper.dart';
import '../../services/auth_service.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl extends ChangeNotifier implements AuthRepository  {
  final AuthService _authService;
  final SharedPreferences _prefs;

  final _userController = StreamController<UserResponse?>.broadcast();
  UserResponse? _currentUser;
  bool? _isTemporaryPassword = false;

  AuthRepositoryImpl({
    required AuthService authService,
    required SharedPreferences prefs,
  }) : _authService = authService,
       _prefs = prefs{_initialize();}

  @override
  Stream<UserResponse?> get userStream => _userController.stream;

  @override
  UserResponse? get currentUser => _currentUser;
  @override
  bool? get isTemporaryPassword => _isTemporaryPassword;

  Future<void> _initialize() async {
    final token = _prefs.getString('auth_token');
    final userJson = _prefs.getString('user_data');

    if (token == null || token.isEmpty) {
      _setUser(null);
      return;
    }

    try {
      final isExpired = Jwt.isExpired(token);
      if (isExpired) {
        await logout();
        return;
      }

      if (userJson != null) {
        final user = UserResponse.fromJson(jsonDecode(userJson));
        _setUser(user);
      } else {
        _setUser(null);
      }
    } catch (e) {
      await logout();
    }
  }

  @override
  AsyncResult<UserResponse> login({required LoginRequest loginRequest}) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();

      final data = await _authService.login(
        loginRequest: loginRequest.copyWith(fcmToken: fcmToken).toJson(),
      );

      final token = AuthTokens.fromJson(data);

      await _saveTokens(token);
      _isTemporaryPassword = token.mustChangePassword;
      _setUser(token.user);

      return Success(token.user);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  @override
  AsyncResult<void> logout() async {
    try {
      await _authService.logout();
      await _prefs.remove('auth_token');
      await _prefs.remove('refresh_token');
      await _prefs.remove('user_data');
      _isTemporaryPassword = null;
      _setUser(null);
      return Success(Null);
    } catch (e) {
      return Failure(ExceptionMapper.map(e));
    }
  }

  Future<void> _saveTokens(AuthTokens token) async {
    await _prefs.setString('auth_token', token.accessToken);
    await _prefs.setString('refresh_token', token.accessToken);
    await _prefs.setString('user_data', jsonEncode(token.user.toJson()));
    notifyListeners();
  }


  void _setUser(UserResponse? user) {
    _currentUser = user;
    _userController.add(user);
    notifyListeners();
  }
  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }


}

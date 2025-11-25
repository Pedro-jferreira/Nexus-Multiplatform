import 'package:Nexus/data/services/users_service.dart';
import 'package:flutter/widgets.dart';

typedef UserData = Map<String, dynamic>;

class ProfileViewModel extends ChangeNotifier {
  final UsersServices _usersService;

  UserData? _user;

  UserData? get user => _user;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  ProfileViewModel(this._usersService);

  Future<void> loadUserProfile({required int userId}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _usersService.findByID(userID: userId);
      _errorMessage = null;
    } catch (e) {
      _user = null;
      _errorMessage = 'Falha ao carregar perfil: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

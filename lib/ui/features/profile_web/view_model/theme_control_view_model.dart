import 'package:flutter/material.dart';

import '../../../../data/repositories/theme_control_repository.dart';

class ThemeControlViewModel extends ChangeNotifier {
  final ThemeControlRepository _repository;

  late bool _isDarkMode;

  ThemeControlViewModel({required ThemeControlRepository repository})
      : _repository = repository {
    _isDarkMode = _repository.darkMode;
  }

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // Método chamado pela UI (pelo Switch, por exemplo)
  void changeTheme(bool value) {
    _isDarkMode = value;
    _repository.setDarkMode(value);
    notifyListeners();
  }
}
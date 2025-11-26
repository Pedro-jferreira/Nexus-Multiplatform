

import 'package:Nexus/data/repositories/theme_control_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeControlRepositoryImpl implements ThemeControlRepository {
  final SharedPreferences _prefs;
  final String key = 'is_dark_mode';
  late bool _darkMode;

  ThemeControlRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs {
    _initState();
  }

  void _initState() {
    _darkMode = _prefs.getBool(key) ?? false;
  }
  Future<void> _setPrefs(bool darkMode) async {
    await _prefs.setBool(key, darkMode);
  }

  @override
  bool get darkMode => _darkMode;

  @override
  void setDarkMode(bool darkMode) {
    _darkMode = darkMode;
    _setPrefs(darkMode);
  }
}
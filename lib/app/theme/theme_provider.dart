import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class IThemeService {
  ThemeMode getThemeMode();
  void saveThemeMode(ThemeMode themeMode);
  void changeThemeMode(ThemeMode themeMode);
  bool isThemeModeSaved();
}

class ThemeService implements IThemeService {
  final _getStorage = GetStorage();

  String get key => 'isThemeDark';
  static const themeModeDark = 'ThemeMode.dark';
  static const themeModeLight = 'ThemeMode.light';
  static const themeModeSystem = 'ThemeMode.system';

  @override
  ThemeMode getThemeMode() {
    var val = _getStorage.read(key);
    switch (val) {
      case themeModeDark:
        return ThemeMode.dark;
      case themeModeLight:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  @override
  void saveThemeMode(ThemeMode themeMode) {
    _getStorage.write(key, themeMode.toString());
  }

  @override
  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    saveThemeMode(themeMode);
  }

  @override
  bool isThemeModeSaved() {
    return _getStorage.read(key) ?? false;
  }
}

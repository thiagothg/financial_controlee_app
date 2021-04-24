import 'dart:async';

import 'package:flutter/material.dart';

import '../interface/shared_repository_interface.dart';
import '../storage/local_storage.dart';


class SharedRepository implements ISharedRepositoryInterface {

  static const themeMode = 'theme_mode';
  static const themeModeDark = 'ThemeMode.dark';
  static const themeModeLight = 'ThemeMode.light';
  static const themeModeSystem = 'ThemeMode.system';

  @override
  String readUserInfo() {
    return '';
  }

  @override
  void saveUserInfo(String userInfo) {
    return null;
  }

  @override
  Future<ThemeMode> readThemeMode() async {
    return await LocalStorage.getValue<String>(themeMode).then(
      (value) {
        switch (value) {
          case themeModeDark:
              return ThemeMode.dark;
          case themeModeLight:
              return ThemeMode.light;
          default:
            return ThemeMode.system;
        }
      }
    );
  }

  @override
  Future<bool> saveThemeMode(ThemeMode theme) async {
    return await LocalStorage.setValue<String>(
        themeMode, theme.toString());
  }
}
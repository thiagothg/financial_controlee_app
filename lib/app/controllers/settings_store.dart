import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../app_controller.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;
abstract class _SettingsStoreBase with Store {

  final app = Modular.get<AppController>();

  _SettingsStoreBase() {
    selectedRadio = app.themeMode;
  }

  @observable
  ThemeMode selectedRadio = ThemeMode.system;

  @computed
  String get getTheme => app.themeApp.themeToString();

  @computed
  ThemeMode get getSelectedRadio => selectedRadio;

  @action 
  Future<void> setTheme(ThemeMode theme) async {
    selectedRadio = theme;
    await app.setThemeData(theme);
    print(theme.toString());
  }
}
import 'package:financial_controlee_app/app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  //Essencial
  final themeService = Get.find<ThemeService>();

  Rx<ThemeMode?> radio = Rx<ThemeMode?>(null);
  List<Map<String, dynamic>> themes = [
    {'theme': ThemeMode.light, 'name': 'Light', 'desc': null},
    {'theme': ThemeMode.dark, 'name': 'dark', 'desc': null},
    {
      'theme': ThemeMode.system,
      'name': 'System',
      'desc': 'Vamos ajustar sua aparencia baseado no tema do celular '
    },
  ];

  @override
  void onInit() {
    radio = themeService.getThemeMode().obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void changeTheme(ThemeMode mode) {
    radio.value = mode;
    print(radio);
    themeService.changeThemeMode(mode);
    update();
  }
}

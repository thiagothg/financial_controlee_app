import 'package:financial_controlee_app/app/global/core/localization/generated/l10n.dart';
import 'package:financial_controlee_app/app/global/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  //Essencial

  final appController = Get.find<AppService>();
  final box = GetStorage();

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

  List<Locale> list = S.delegate.supportedLocales;
  Rx<Locale?> groupValue = Rx(Get.locale);

  @override
  void onInit() {
    radio = appController.getTheme().obs;
    super.onInit();
  }

  @override
  void onClose() {}

  void changeTheme(ThemeMode mode) {
    radio.value = mode;
    appController.changeTheme(mode);
    update();
  }

  void changeLanguage(Locale locale) {
    groupValue.value = locale;
    appController.changeLanguage(locale);
    update();
  }
}

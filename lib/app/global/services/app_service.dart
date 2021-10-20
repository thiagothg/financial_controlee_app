import '../../data/model/user_model.dart';
import '../core/localization/generated/l10n.dart';
import '../../theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'auth_service.dart';

class AppService extends GetxController {
  //Essencial
  final auth = Get.find<AuthService>();
  final themeService = Get.find<ThemeService>();
  final box = GetStorage();

  PageController pageController = PageController();
  final page = 0.obs;
  Rx<User?> get getUser => Rx<User?>(auth.user.value?.user);
  Rx<Locale?> currentLocale = Get.locale.obs;

  @override
  void onInit() {
    currentLocale = Rx(getLanguage());
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  void changePage(int p) => page.value = p;

  /// Theme
  ThemeMode getTheme() => themeService.getThemeMode();
  void changeTheme(ThemeMode mode) {
    themeService.changeThemeMode(mode);
  }

  /// language
  Locale getLanguage() {
    var val = box.read('locale');
    print(Get.locale!);

    print(val);
    if (val != null) {
      return Get.locale!;
    } else {
      return Get.locale!;
    }
  }

  Future<void> changeLanguage(Locale locale) async {
    currentLocale = locale.obs;
    Get.updateLocale(locale);
    S.load(locale);
    await box.write('locale', {
      'countryCode': locale.countryCode,
      'languageCode': locale.languageCode
    });
  }
}

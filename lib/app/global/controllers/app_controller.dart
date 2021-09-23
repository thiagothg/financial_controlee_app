import 'package:financial_controlee_app/app/data/model/user_model.dart';
import 'package:financial_controlee_app/app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class AppController extends GetxController {
  //Essencial
  final auth = Get.find<AuthController>();
  final theme = Get.find<ThemeService>();

  PageController pageController = PageController();
  final page = 0.obs;
  Rx<UserModel?> get getUser => Rx<UserModel?>(auth.user.value?.user);

  @override
  void onClose() {
    pageController.dispose();
  }

  void changePage(int p) => page.value = p;
}

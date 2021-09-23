import 'package:financial_controlee_app/app/data/model/user_model.dart';
import 'package:financial_controlee_app/app/global/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Essencial
  final auth = Get.find<AuthController>();

  Rx<UserModel?> get getUser => Rx<UserModel?>(auth.user.value?.user);

  @override
  void onInit() {
    print('onInit HomeController');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady');
    super.onReady();
  }

  @override
  void onClose() {}
}

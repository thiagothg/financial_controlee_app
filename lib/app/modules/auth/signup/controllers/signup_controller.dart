import '../../../../global/services/auth_service.dart';

import '../../../../global/utils/components/snackbars/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  ///
  final authService = Get.find<AuthService>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  Rx<FocusNode> emailFocus = Rx(FocusNode());
  Rx<FocusNode> passwordFocus = Rx(FocusNode());
  Rx<FocusNode> confirmPasswordFocus = Rx(FocusNode());

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void togglePasswordVibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  Future<void> signup() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    try {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        await Future.delayed(Duration(milliseconds: 1400));
        await authService.signup(emailController.text.trim(),
            passwordController.text.trim(), nameController.text.trim());

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      SnackBars(title: 'Cadastro', message: e.toString()).errorSnackbar();
    }
  }
}

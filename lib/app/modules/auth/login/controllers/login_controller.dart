import '../../../../global/services/auth_service.dart';

import '../../../../global/utils/components/snackbars/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final authService = Get.find<AuthService>();
  final emailController = TextEditingController(text: 'teste@app.com');
  final passwordController = TextEditingController(text: 'teste123');

  RxBool isPasswordVisible = false.obs;
  Rx<FocusNode> passwordfocus = Rx(FocusNode());
  RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void togglePasswordVibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  Future<void> forgotPassword() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (emailController.text != '' && GetUtils.isEmail(emailController.text)) {
      try {
        await authService.forgotPassword(emailController.text);
        SnackBars(title: 'Resetar Senha', message: 'Foi enviado email')
            .successSnackbar();
      } catch (e) {
        SnackBars(title: 'Resetar Senha', message: e.toString())
            .errorSnackbar();
      }
    } else {
      SnackBars(title: 'Resetar Senha', message: 'Insira um email válido')
          .errorSnackbar();
    }
  }

  Future<void> login() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (emailController.text != '' &&
        GetUtils.isEmail(emailController.text) &&
        passwordController.text != '') {
      try {
        isLoading.value = true;
        await Future.delayed(Duration(milliseconds: 1500));
        await authService.login(emailController.text, passwordController.text);
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        SnackBars(title: 'Login', message: e.toString()).errorSnackbar();
      }
    } else {
      SnackBars(title: 'Login', message: 'Preenche os campos').errorSnackbar();
    }
  }

  Future<void> signInWithGoogle() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    try {
      await authService.signInWithGoogle();
    } catch (e) {
      SnackBars(title: 'Login', message: e.toString()).errorSnackbar();
    }
  }

  Future<void> signInWithFacebook() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    try {
      await authService.signInWithFacebook();
    } catch (e) {
      SnackBars(title: 'Login', message: e.toString()).errorSnackbar();
    }
  }

  Future<void> signInWithApple() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    try {
      await authService.signInWithApple();
    } catch (e) {
      SnackBars(title: 'Login', message: e.toString()).errorSnackbar();
    }
  }

  void onSubmittedEmail() {}
}

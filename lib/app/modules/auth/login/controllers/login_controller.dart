import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'teste@app.com');
  final passwordController = TextEditingController(text: 'teste123');

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
import 'package:financial_controlee_app/app/global/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authController = Get.find<AuthController>();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignupView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () => authController.login(
                        controller.emailController.text,
                        controller.passwordController.text),
                    child: Text('SignUp')),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tem conta ?'),
                    TextButton(
                        onPressed: () => Get.back(), child: Text('Login'))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

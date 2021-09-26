import 'package:financial_controlee_app/app/global/controllers/auth_controller.dart';
import 'package:financial_controlee_app/app/routes/app_pages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authController = Get.find<AuthController>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
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
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 50)),
                ),
                SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () => authController.signInWithGoogle(),
                  label: Text('Sign up with google'),
                  icon: FaIcon(FontAwesomeIcons.google),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 50)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tem conta ?'),
                    TextButton(
                        onPressed: () => Get.toNamed(Routes.SIGNUP),
                        child: Text('Criar conta'))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

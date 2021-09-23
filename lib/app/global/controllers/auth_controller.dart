import 'package:financial_controlee_app/app/data/model/auth_model.dart';
import 'package:financial_controlee_app/app/data/repository/auth/auth_repository.dart';
import 'package:financial_controlee_app/app/global/controllers/app_controller.dart';
import 'package:financial_controlee_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  //Essencial
  static AuthController to = Get.find();
  AppController? appController;
  final AuthRepository authRepository;
  final box = GetStorage('barberapp');

  AuthController(this.authRepository);

  Rx<Stream<Auth?>> get authStatus =>
      authRepository.authProvider.authStatus.obs;

  Rx<Auth?> user = Rx<Auth?>(null);

  RxBool isLoggendIn = false.obs;

  @override
  void onInit() {
    ever(isLoggendIn, fireRoute);
    authStatus.value.listen((event) {
      if (event != null) {
        user = Rx(event);
        box.write('auth', event.user.id);
      } else {
        box.erase();
      }
      isLoggendIn = RxBool(event != null);
    });

    super.onInit();
  }

  fireRoute(logged) {
    if (!logged) {
      // Get.toNamed();
    }
  }

  @override
  void onReady() {
    appController = Get.put(AppController());
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> verifyAuth() async {
    var auth = box.read('auth');
    if (auth != null || user.value != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  ///
  Future<void> signup(String email, String password) async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      var user = await authRepository.signup(email, password);
      if (user != null) {
        Get.offAllNamed(Routes.HOME);
      }
      // Get.defaultDialog(
      //     title: 'Email verificação',
      //     middleText: 'Por favor verifique email: $email.',
      //     onConfirm: () {
      //       Get.back();
      //       Get.back();
      //     },
      //     textConfirm: 'confirm');

    } catch (e) {
      print(e);

      GetBar(
        messageText: Text("Error acuror"),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
      ).show();
    }
  }

  ///
  Future<void> login(String email, String password) async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      var user = await authRepository.login(email.trim(), password.trim());

      Get.offAllNamed(Routes.HOME);
      // if (credential.user!.emailVerified) {
      // } else {
      //   Get.defaultDialog(
      //       title: 'Por favor verifica seu email',
      //       middleText: 'Por favor verifique email: $email.',
      //       onConfirm: () {
      //         Get.back();
      //         Get.back();
      //       },
      //       textConfirm: 'confirm');
      // }
    } on FirebaseAuthException catch (e) {
      print('${e.message} - ${e.toString()}');

      var message = 'erro';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }

      GetBar(
        messageText: Text(message),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
      ).show();
    } catch (e) {
      print(e.toString());

      GetBar(
        messageText: Text("Error acuror"),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
      ).show();
    }
  }

  ///
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    appController?.page.value = 0;
    await box.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

  ///
  Future<void> signInWithGoogle() async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      await authRepository.signInWithGoogle();
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e.toString());
      GetBar(
        messageText: Text("Error acuror"),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
      ).show();
    }
  }
}

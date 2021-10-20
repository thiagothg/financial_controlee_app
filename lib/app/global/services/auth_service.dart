import '../../data/model/auth_model.dart';
import '../../data/repository/auth/auth_repository.dart';
import '../../routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_service.dart';

class AuthService extends GetxController {
  //Essencial
  static AuthService to = Get.find();
  AppService? appService;
  final AuthRepository authRepository;
  final box = GetStorage();

  AuthService(this.authRepository);

  Rx<Stream<Auth?>> get authStatus =>
      authRepository.authProvider.authStatus.obs;

  Rx<Auth?> user = Rx<Auth?>(null);

  RxBool isLoggendIn = false.obs;

  @override
  void onInit() {
    // ever(isLoggendIn, fireRoute);
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
    appService = Get.find<AppService>();
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
  Future<void> signup(String email, String password, String name) async {
    await authRepository.signup(email, password, name);

    Get.offAllNamed(Routes.HOME);
  }

  ///
  Future<void> login(String email, String password) async {
    await authRepository.login(email.trim(), password.trim());

    Get.offAllNamed(Routes.HOME);
  }

  ///
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    appService?.page.value = 0;
    await box.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

  ///
  Future<void> signInWithGoogle() async {
    await authRepository.signInWithGoogle();
    Get.offAllNamed(Routes.HOME);
  }

  ///
  Future<void> signInWithFacebook() async {
    await authRepository.signInWithfacebook();
    Get.offAllNamed(Routes.HOME);
  }

  ///
  Future<void> signInWithApple() async {
    await authRepository.signInWithApple();
    Get.offAllNamed(Routes.HOME);
  }

  ///
  Future<void> forgotPassword(String email) async {
    await authRepository.forgotPassword(email);
  }
}

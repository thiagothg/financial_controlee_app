import 'package:financial_controlee_app/app/global/services/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final authController = Get.find<AuthService>();

  @override
  void onInit() {
    verifyAuth();
    super.onInit();
  }

  Future<void> verifyAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    await authController.verifyAuth();
  }
}

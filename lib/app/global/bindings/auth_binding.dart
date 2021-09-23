import 'package:financial_controlee_app/app/data/repository/auth/auth_repository.dart';
import 'package:financial_controlee_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());

    Get.lazyPut<LoginController>(
      () => LoginController(
          // Get.find<AuthRepository>(),
          ),
    );
    // Get.lazyPut<RegisterController>(
    //   () => RegisterController(
    //     Get.find<AuthRepository>(),
    //   ),
    // );
  }
}

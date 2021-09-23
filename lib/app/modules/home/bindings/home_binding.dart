import 'package:financial_controlee_app/app/data/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.lazyPut<AuthRepository>(() => AuthRepository());
  }
}
